import 'dart:io';

import 'package:b2b_services/app/Services/graphql_conf.dart';
import 'package:b2b_services/app/modules/home/data/mutation/starttrip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrForDriverController extends GetxController {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  Barcode? result;
  QRViewController? controllers;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var data = "".obs;
  var isLoading = false.obs;
  final count = 0.obs;

  @override
  void dispose() {
    controllers?.dispose();
    super.dispose();
  }

  void reassemble() {
    if (Platform.isAndroid) {
      controllers!.pauseCamera();
    }
    controllers!.resumeCamera();
  }


  buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void onQRViewCreated(QRViewController controllerp) {
    controllers = controllerp;

    controllerp.scannedDataStream.listen((scanData) {
      result = scanData;
      data.value = result!.code.toString();
    });

    if (data.isNotEmpty) {
      isLoading(true);
    } else {
      isLoading(false);
    }
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    //log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  startTrip() async {
    GraphQLClient client = graphQLConfiguration.clientToQuery();

    QueryResult result = await client.mutate(
      MutationOptions(
        document: gql(UpdateDropoff.request),
        variables: <String, dynamic>{
          'id': data.value,
          'status': "STARTED",
        },
      ),
    );

    if (!result.hasException) {
      data.value = "";
      Get.dialog(AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const Text(
          'Trip, Started',
          style: TextStyle(fontSize: 18, color: Colors.green),
        ),
      ));

      justWait(numberOfSeconds: 2);
    } else {
      data.value = "";
      Get.dialog(AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const Text(
          'Error, Try Again',
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
      ));
    }
  }

  void justWait({required int numberOfSeconds}) async {
    await Future.delayed(Duration(seconds: numberOfSeconds));
    Get.back();
    Get.back();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
