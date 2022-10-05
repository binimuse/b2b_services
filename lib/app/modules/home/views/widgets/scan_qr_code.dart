import 'dart:io';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRCodepage extends StatefulWidget {
  const ScanQRCodepage({super.key});

  @override
  State<ScanQRCodepage> createState() => _ScanQRCodepageState();
}

class _ScanQRCodepageState extends State<ScanQRCodepage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 5, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text('Barcode Type:    Data: ${result!.code}')
                  else
                    const Text('Scan a code'),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    height: 14.w,
                    width: 50.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 62, 164, 247),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: 2.3.h),
                        ),
                        onPressed: () async {
                          await controller?.toggleFlash();
                          setState(() {});
                        },
                        child: FutureBuilder(
                          future: controller?.getFlashStatus(),
                          builder: (context, snapshot) {
                            return snapshot.data == true
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Turn off Flash',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: Color.fromARGB(
                                                      255, 62, 164, 247),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13.sp)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.flashlight_off,
                                        color:
                                            Color.fromARGB(255, 62, 164, 247),
                                      )
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Text('Turn on Flash',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: Color.fromARGB(
                                                      255, 62, 164, 247),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13.sp)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.flashlight_on,
                                        color:
                                            Color.fromARGB(255, 62, 164, 247),
                                      )
                                    ],
                                  );
                          },
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 70.w
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
