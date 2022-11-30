// ignore_for_file: iterable_contains_unrelated_type

import 'package:b2b_services/app/common/widgets/custom_button_feedback.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/color_util.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/data/model/items_model.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../data/model/getdriver_model.dart';

class ItemOrder2 extends StatefulWidget {
  ItemOrder2({
    Key? key,
    required this.onTap,
    this.dropofforder,
    this.index,
  }) : super(key: key);

  final VoidCallback onTap;

  final Dropofforder? dropofforder;
  final int? index;

  @override
  State<ItemOrder2> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder2> {
  ///
  bool isSelected = false;
  bool isSelectedItems = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomColors.white,
      borderRadius: BorderRadius.circular(CustomSizes.radius_6),
      elevation: 4,
      shadowColor: CustomColors.black.withOpacity(0.2),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CustomSizes.mp_w_4,
          vertical: CustomSizes.mp_w_2,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///BUILD ICON CONTAINER
                buildIcon(),

                SizedBox(
                  width: CustomSizes.mp_w_4,
                ),

                ///BUILD ITEM INFO
                buildItemInfo(context),
              ],
            ),
            isSelectedItems
                ? Column(
                    children: [buildExpandableView(), buildExpandableView2()])
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Material buildIcon() {
    return Material(
      color: CustomColors.blue.withOpacity(0.05),
      borderRadius: BorderRadius.circular(CustomSizes.radius_8),
      child: Padding(
        padding: EdgeInsets.all(
          CustomSizes.mp_w_6,
        ),
        child: Icon(
          FontAwesomeIcons.layerGroup,
          size: CustomSizes.icon_size_8,
          color: CustomColors.blue,
        ),
      ),
    );
  }

  buildItemInfo(context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              widget.dropofforder!.orderId.isNotEmpty
                  ? Expanded(
                      child: Text(
                        "order Id - ${widget.dropofforder!.orderId}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: CustomColors.black,
                              fontSize: CustomSizes.font_10,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    )
                  : SizedBox(),
              Material(
                color: CustomColors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(CustomSizes.radius_6 * 6),
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: CustomSizes.mp_w_4,
                    vertical: CustomSizes.mp_v_1 / 2,
                  ),
                  child: Text(
                    widget.dropofforder!.itemsmodel.length.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorUtil.darken(CustomColors.blue, 0.1),
                          fontSize: CustomSizes.font_8,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: CustomSizes.mp_v_1 / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                FontAwesomeIcons.receipt,
                color: CustomColors.blue,
                size: CustomSizes.icon_size_4,
              ),
              SizedBox(
                width: CustomSizes.mp_w_1,
              ),
              widget.dropofforder!.received.isNotEmpty
                  ? Text(
                      "received - ${widget.dropofforder!.received.toString()}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: CustomColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                    )
                  : SizedBox(),
              SizedBox(
                width: CustomSizes.mp_w_1,
              ),
            ],
          ),
          SizedBox(
            height: CustomSizes.mp_v_1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                FontAwesomeIcons.recordVinyl,
                color: CustomColors.blue,
                size: CustomSizes.icon_size_4,
              ),
              SizedBox(
                width: CustomSizes.mp_w_1,
              ),
              Text(
                "status - ${widget.dropofforder!.status.toString()}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: CustomColors.black,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(
                width: CustomSizes.mp_w_1,
              ),
            ],
          ),
          SizedBox(
            height: CustomSizes.mp_v_1,
          ),
          Row(
            children: [
              CustomButtonFeedBack(
                onTap: () {
                  setState(() {
                    isSelectedItems = !isSelectedItems;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(CustomSizes.mp_w_1),
                  child: Text(
                    "Items Details",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ColorUtil.darken(CustomColors.blue, 0.1),
                          fontWeight: FontWeight.w500,
                          fontSize: CustomSizes.font_10,
                        ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              CustomButtonFeedBack(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });

                  if (isSelected) {
                    //  print(widget.dropofforder!.dropOffid);
                    Get.toNamed(Routes.SCAN_QR_CODE,
                        arguments: {"order": widget.dropofforder});
                  } else {}
                },
                child: Container(
                  width: CustomSizes.icon_size_8,
                  height: CustomSizes.icon_size_8,
                  child: Stack(
                    children: [
                      Icon(
                        FontAwesomeIcons.check,
                        size: isSelected
                            ? CustomSizes.icon_size_8
                            : CustomSizes.icon_size_6,
                        color:
                            isSelected ? CustomColors.green : CustomColors.blue,
                      ),
                      isSelected
                          ? Positioned(
                              left: 0,
                              right: 4,
                              bottom: 7,
                              top: 0,
                              child: Icon(
                                FontAwesomeIcons.check,
                                size: CustomSizes.icon_size_4,
                                color: CustomColors.white,
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: CustomSizes.mp_w_1,
              ),
            ],
          ),
          SizedBox(
            height: CustomSizes.mp_v_1,
          ),
        ],
      ),
    );
  }

  Column buildExpandableView2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(
              left: CustomSizes.mp_w_6, top: CustomSizes.mp_v_2),
          itemBuilder: (context, index) {
            return buildDetailsRow2(
                context, widget.dropofforder!.itemsmodel[index]);
          },
          separatorBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: CustomSizes.mp_v_1,
              ),
              child: const Divider(
                height: 1,
                color: CustomColors.grey,
              ),
            );
          },
          itemCount: widget.dropofforder!.itemsmodel.length,
        ),
        SizedBox(
          height: CustomSizes.mp_v_1,
        ),
      ],
    );
  }

  Column buildExpandableView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(
              left: CustomSizes.mp_w_6, top: CustomSizes.mp_v_2),
          itemBuilder: (context, index) {
            return buildDetailsRow(
                context, widget.dropofforder!.itemsmodel[index]);
          },
          separatorBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: CustomSizes.mp_v_1,
              ),
              child: const Divider(
                height: 1,
                color: CustomColors.grey,
              ),
            );
          },
          itemCount: widget.dropofforder!.itemsmodel.length,
        ),
        SizedBox(
          height: CustomSizes.mp_v_1,
        ),
      ],
    );
  }

  buildDetailsRow2(BuildContext context, ItemsModelOrder itemsmodel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            "total price",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: CustomColors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: CustomSizes.font_8,
                ),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Text(
          widget.dropofforder!.totalPrice.toString(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomColors.grey,
                fontSize: CustomSizes.font_10,
              ),
        ),
      ],
    );
  }

  buildDetailsRow(BuildContext context, ItemsModelOrder itemsmodel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            itemsmodel.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: CustomColors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: CustomSizes.font_8,
                ),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Text(
          itemsmodel.quantity,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomColors.grey,
                fontSize: CustomSizes.font_10,
              ),
        ),
      ],
    );
  }
}
