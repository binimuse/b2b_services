import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/modules_distributer/arrived_page_distributer/views/widgets/item_order.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: CustomSizes.mp_w_4),
        itemBuilder: (context, index) {
          return Padding(
            padding: index==0? EdgeInsets.only(top: CustomSizes.mp_v_2):EdgeInsets.zero,
            child: const ItemOrder(),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: CustomSizes.mp_w_2,
          );
        },
        itemCount: 12,
      ),
    );
  }
}
