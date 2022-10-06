import 'dart:async';

import 'package:b2b_services/app/constant/constants.dart';
import 'package:flutter/material.dart';

import '../config/theme/custom_colors.dart';
import 'global_style.dart';

class ReusableWidget {
  PreferredSizeWidget bottomAppBar() {
    return PreferredSize(
        child: Container(
          color: Colors.grey[100],
          height: 1.0,
        ),
        preferredSize: const Size.fromHeight(1.0));
  }

  Widget createRatingBar({double rating = 5, double size = 24}) {
    if (rating < 0) {
      rating = 0;
    } else if (rating > 5) {
      rating = 5;
    }

    bool _absolute = false;
    int _fullStar = 0;
    int _emptyStar = 0;

    if (rating == 0 ||
        rating == 1 ||
        rating == 2 ||
        rating == 3 ||
        rating == 4 ||
        rating == 5) {
      _absolute = true;
    } else {
      double _dec = (rating - int.parse(rating.toString().substring(0, 1)));
      if (_dec > 0 && _dec < 1) {
        if (_dec >= 0.25 && _dec <= 0.75) {
          _absolute = false;
        } else {
          _absolute = true;
          if (_dec < 0.25) {
            _emptyStar = 1;
          } else if (_dec > 0.75) {
            _fullStar = 1;
          }
        }
      }
    }
    return Row(
      children: [
        for (int i = 1; i <= rating + _fullStar; i++)
          Icon(Icons.star, color: Colors.yellow[700], size: size),
        !_absolute
            ? Icon(Icons.star_half, color: Colors.yellow[700], size: size)
            : const SizedBox.shrink(),
        for (int i = 1; i <= (5 - rating + _emptyStar); i++)
          Icon(Icons.star_border, color: Colors.yellow[700], size: size),
      ],
    );
  }

  Widget buildRestaurantList(context, index, data) {
    final double boxImageSize = (MediaQuery.of(context).size.width / 4);
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => RestaurantInformationPage()));

            // Get.toNamed(
            //   Routes.RECOMMENDEDHOSPITALS,
            //   arguments: {
            //     "name": data[index].name,
            //     "city": data[index].city,
            //     "zone": data[index].zone,
            //     "woreda": data[index].woreda,
            //     "kebele": data[index].kebele,
            //     "about": data[index].about,
            //     "phone": data[index].phone,
            //     "email": data[index].email,
            //     "image": data[index].image,
            //   },
            // );
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  child: Image.asset(
                    "assets/images/oil.png",
                    width: boxImageSize,
                    height: boxImageSize,
                    color: Colors.transparent, //40%
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index].name,
                        style: GlobalStyle.textRestaurantNameBig,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      // Text(
                      //   data[index].tag,
                      //   style: GlobalStyle.textTag,
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.price_change,
                              color: Colors.orange, size: 15),
                          const SizedBox(width: 5),
                          Text(data[index].phone.toString(),
                              style: GlobalStyle.textRatingDistances),
                          const SizedBox(width: 6),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const SizedBox.shrink(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        (index == data.length - 1)
            ? Wrap()
            : Divider(
                height: 0,
                color: Colors.grey[400],
              )
      ],
    );
  }

  Widget customNotifIcon(
      {int count = 0,
      Color notifColor = Colors.grey,
      Color labelColor = Colors.pinkAccent,
      double notifSize = 24,
      double labelSize = 14,
      String position = 'right'}) {
    double? posLeft;
    double? posRight = 0;
    if (position == 'left') {
      posLeft = 0;
      posRight = null;
    }
    return Stack(
      children: <Widget>[
        Icon(Icons.notifications, color: notifColor, size: notifSize),
        Positioned(
          left: posLeft,
          right: posRight,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: labelColor,
              borderRadius: BorderRadius.circular(labelSize),
            ),
            constraints: BoxConstraints(
              minWidth: labelSize,
              minHeight: labelSize,
            ),
            child: Center(
              child: Text(
                count.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget divider1() {
    return Divider(height: 0, color: Colors.grey[400]);
  }

  Future _showProgressDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  // dummy loading
  void startLoading(context, String textMessage, int backToPreviousPageStack) {
    _showProgressDialog(context);
    Timer(const Duration(seconds: 2), () {
      Navigator.pop(context);
      _buildShowDialog(context, textMessage, backToPreviousPageStack);
    });
  }

  Future _buildShowDialog(
      BuildContext context, String textMessage, int backToPreviousPageStack) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)), //this right here
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      textMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, color: BLACK_GREY),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) => kPrimaryColor,
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                        ),
                        onPressed: () {
                          Navigator.pop(context);

                          if (backToPreviousPageStack > 0) {
                            FocusScope.of(context)
                                .unfocus(); // hide keyboard when press button
                            for (int i = 1; i <= backToPreviousPageStack; i++) {
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'OK',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
  // end dummy loading

  Widget createDefaultLabel(context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(2)),
      child: Row(
        children: const [
          Text('Default', style: TextStyle(color: Colors.white, fontSize: 13)),
          SizedBox(
            width: 4,
          ),
          Icon(Icons.done, color: Colors.white, size: 11)
        ],
      ),
    );
  }

  Widget deliveryInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: const Text(
            'Delivery Information',
            style: GlobalStyle.deliveryInformationTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: SOFT_BLUE),
                    child: const Center(
                        child: Icon(Icons.restaurant,
                            size: 12, color: Colors.white)),
                  ),
                  const SizedBox(width: 8),
                  const Flexible(
                    child: Text('M3GC+C2 Mexico, Addis ababa',
                        style: GlobalStyle.deliveryInformationAddress,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
              const SizedBox(height: 4),
              Container(
                  margin: const EdgeInsets.only(left: 11),
                  width: 1,
                  height: 12,
                  color: SOFT_GREY),
              const SizedBox(height: 2),
              Row(
                children: const [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Center(
                        child: Icon(Icons.location_pin,
                            size: 24, color: CustomColors.lightWhite)),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text('My Address',
                        style: GlobalStyle.deliveryInformationAddress,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
