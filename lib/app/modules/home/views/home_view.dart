import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  static final CameraPosition initialposition = CameraPosition(
      target: LatLng(9.014302408008586, 38.757550910492846), zoom: 18);
  late GoogleMapController googleMapController;
  late final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late Position currentposition;
  var geolocator = Geolocator();

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 57, 152, 230),
          onPressed: (() {}),
          child: Icon(Icons.phone, color: Colors.white)),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              child: GoogleMap(
                  myLocationButtonEnabled: true,
                  myLocationEnabled: false,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: initialposition,
                  onMapCreated: (GoogleMapController controller) {
                    _controllerGoogleMap.complete(controller);
                    googleMapController = controller;
                    // locatePosition();
                  }),
            ),
            customappbar(),
            popupdialogue(context),
            Align(
              alignment: Alignment.bottomCenter,
              child: finishandstartbutton("Start Delivery",context))
          ],
        ),
      ),
    );
  }

  Container customappbar() {
    return Container(
      height: 8.h,
      width: Get.width,
      color: Colors.white.withOpacity(0.7),
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.greenAccent,
                size: 9.w,
              )),
          SizedBox(
            width: 2.w,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.qr_code_scanner_rounded,
                    color: Colors.greenAccent,
                    size: 9.w,
                  )),
              SizedBox(
                width: 2.w,
              ),
              Obx(() {
                return Container(
                  alignment: Alignment.topCenter,
                  child: FlutterSwitch(
                    activeColor: Colors.greenAccent,
                    width: 30.w,
                    height: 6.h,
                    valueFontSize: 25.0,
                    toggleSize: 10.w,
                    value: controller.status.value,
                    borderRadius: 5.0,
                    padding: 8.0,
                    showOnOff: true,
                    onToggle: (val) {
                      controller.status.value = val;
                    },
                  ),
                );
              }),
            ],
          )
        ],
      ),
    );
  }

  Container popupdialogue(BuildContext context) {
    return Container(
      width: Get.width,
      height: 30.h,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                width: 25.w,
                height: 15.h,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 68, 171, 255).withOpacity(0.1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    )),
                child: Icon(
                  Icons.local_shipping_rounded,
                  size: 15.w,
                  color: Color.fromARGB(255, 68, 171, 255),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.my_location,
                          size: 5.w,
                          color: Color.fromARGB(255, 68, 171, 255),
                        ),
                        RichText(
                          text: TextSpan(
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'From :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                              TextSpan(
                                  text: ' Stadium',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2.4.w),
                      child: SizedBox(
                        height: 4.h,
                        child: DottedLine(
                          dashLength: 10,
                          direction: Axis.vertical,
                          dashColor: Color.fromARGB(255, 68, 171, 255),
                          dashGapLength: 1.5,
                          lineThickness: 1,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 5.5.w,
                          color: Color.fromARGB(255, 68, 171, 255),
                        ),
                        RichText(
                          text: TextSpan(
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'To :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                              TextSpan(
                                  text: ' Stadium',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 17.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 20.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 68, 171, 255),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6))),
                      child: Center(
                          child: Text(
                        "200 ETB",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      )),
                    ),
                    Text(
                      "Details",
                      style: TextStyle(
                          color: Color.fromARGB(255, 68, 171, 255),
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              // SizedBox(width: 2.w,)
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 2.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 40.w,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: 2.3.h),
                        ),
                        child: Text('Decline',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                      ),
                    )),
                SizedBox(
                    width: 40.w,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: 2.3.h),
                        ),
                        child: Text('Accept',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container finishandstartbutton(String title,BuildContext context) {
    return Container(
      width: 80.w,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 62, 164, 247),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 2.3.h),
        ),
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
