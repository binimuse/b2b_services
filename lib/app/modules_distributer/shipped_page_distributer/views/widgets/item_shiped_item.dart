import 'package:b2b_services/app/common/widgets/custom_button_feedback.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/color_util.dart';
import 'package:b2b_services/app/modules_distributer/home_distributer/data/model/shipment_model.dart';
import 'package:b2b_services/app/modules_distributer/shipped_page_distributer/views/widgets/dialog_order_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ItemShipedItem extends StatefulWidget {
  const ItemShipedItem({
    Key? key,
    required this.onTap,
    this.shipModel,
    this.index,
  }) : super(key: key);

  final VoidCallback onTap;

  ///ADDITIONAL  PARAMS

  final ShipModel? shipModel;
  final int? index;

  @override
  State<ItemShipedItem> createState() => _ItemShipedItemState();
}

class _ItemShipedItemState extends State<ItemShipedItem> {
  ///
  bool isSelected = false;

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
            ///BUILD MAIN ITEM VIEW
            CustomButtonFeedBack(
              onTap: () {
                widget.onTap();
              },
              child: buildItemView(context),
            ),

            ///BUILD COLLAPSABLE EXPANDABLE VIEW
            isSelected ? buildExpandableView() : SizedBox(),
          ],
        ),
      ),
    );
  }

  Row buildItemView(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///BUILD ICON CONTAINER
        buildImageContainer(),

        SizedBox(
          width: CustomSizes.mp_w_4,
        ),

        ///BUILD ITEM INFO
        buildItemInfo(context),

        SizedBox(
          width: CustomSizes.mp_w_4,
        ),

        ///BUILD INDICATOR ICON
        buildIndicatorIcon(
          FontAwesomeIcons.solidTruckFast,
          CustomColors.green,
        ),
      ],
    );
  }

  Column buildExpandableView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: CustomSizes.mp_v_1,
        ),
        Table(
          border: TableBorder.all(
            color: CustomColors.lightGrey,
            width: 1.0,
            borderRadius: BorderRadius.circular(CustomSizes.radius_4),
          ),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: buildTableDataRows(),
        ),
        SizedBox(
          height: CustomSizes.mp_v_1,
        ),
      ],
    );
  }

  TableCell buildTableHeaderCell(String title) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.top,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: CustomSizes.mp_w_2,
          vertical: CustomSizes.mp_v_1,
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500, color: CustomColors.black),
          ),
        ),
      ),
    );
  }

  Container buildImageContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CustomSizes.radius_6),
        border: Border.all(color: CustomColors.blue.withOpacity(0.9), width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(CustomSizes.radius_8),
        child: Image.network(
          "https://thumbs.dreamstime.com/z/shipped-red-rubber-stamp-vector-isolated-shipped-rubber-stamp-vector-151087084.jpg",
          width: CustomSizes.icon_size_14,
          height: CustomSizes.icon_size_14,
          fit: BoxFit.cover,
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
          Text(
            "Order #${widget.shipModel!.shipmentID}",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomColors.lightBlack.withOpacity(0.7)),
          ),
          Row(
            children: [
              Text(
                "${widget.shipModel!.itemModel.length} items",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: CustomColors.lightBlack.withOpacity(0.7),
                    ),
              ),
              SizedBox(
                width: CustomSizes.mp_w_2,
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
                    isSelected = !isSelected;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(CustomSizes.mp_w_1),
                  child: Text(
                    "Items Details",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ColorUtil.darken(CustomColors.blue, 0.2),
                          fontWeight: FontWeight.w500,
                          fontSize: CustomSizes.font_10,
                        ),
                  ),
                ),
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

  buildDetailsRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            "variModel.attributename",
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
          "5l",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomColors.grey,
                fontSize: CustomSizes.font_10,
              ),
        ),
      ],
    );
  }

  buildIndicatorIcon(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(CustomSizes.mp_w_4 * 0.6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CustomSizes.radius_12 * 3),
        color: color.withOpacity(0.2),
        border: Border.all(color: color, width: 1),
      ),
      child: Icon(
        icon,
        size: CustomSizes.icon_size_4,
        color: color,
      ),
    );
  }

  TableCell buildTableNormalIconCell(IconData icon, Color color) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.top,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: CustomSizes.mp_w_2,
          vertical: CustomSizes.mp_v_1,
        ),
        child: Center(
          child: Icon(
            icon,
            size: CustomSizes.icon_size_4,
            color: color,
          ),
        ),
      ),
    );
  }

  TableCell buildTableNormalCell(String title) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.top,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: CustomSizes.mp_w_2,
          vertical: CustomSizes.mp_v_1,
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w400, color: CustomColors.lightBlack),
          ),
        ),
      ),
    );
  }

  List<TableRow> buildTableDataRows() {
    List<TableRow> rows = List.generate(
      5,
      (index) => TableRow(
        children: <Widget>[
          TableRowInkWell(
            child: buildTableNormalCell(
              "#123WER",
            ),
          ),
          buildTableNormalCell("4kilo"),
          buildTableNormalIconCell(
            FontAwesomeIcons.lightCheckDouble,
            CustomColors.blue,
          ),
          CustomButtonFeedBack(
            onTap: () {
              ///SHOW DETAIL DIALOG
              Get.dialog(
                DialogOrderDetail(),
              );
            },
            child: buildTableNormalIconCell(
              FontAwesomeIcons.chevronRight,
              CustomColors.blue,
            ),
          ),
        ],
      ),
    );

    rows.insert(
      0,
      TableRow(
        children: <Widget>[
          buildTableHeaderCell("Order ID"),
          buildTableHeaderCell("Locations"),
          buildTableHeaderCell("Loaded"),
          buildTableHeaderCell(""),
        ],
      ),
    );

    return rows;
  }
}
