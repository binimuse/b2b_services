import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CustomSizes.radius_10),
        color: CustomColors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 6,
            blurRadius: 8,
          ),
        ],
      ),
      child: SalomonBottomBar(
        currentIndex: 0,
        onTap: (i) {},
        items: [
          ///INCOMING
          buildBottomBarTab(
            context,
            isSelected: true,
            text: 'Incoming',
            icon: FontAwesomeIcons.hourglassStart,
          ),

          ///INCOMING
          buildBottomBarTab(
            context,
            isSelected: false,
            text: 'Incoming',
            icon: FontAwesomeIcons.hourglassStart,
          ),

          ///INCOMING
          buildBottomBarTab(
            context,
            isSelected: false,
            text: 'Incoming',
            icon: FontAwesomeIcons.hourglassStart,
          ),

          ///INCOMING
          buildBottomBarTab(
            context,
            isSelected: false,
            text: 'Incoming',
            icon: FontAwesomeIcons.hourglassStart,
          ),
        ],
      ),
    );
  }

  buildBottomBarTab(context,
      {required bool isSelected,
      required String text,
      required IconData icon}) {
    return SalomonBottomBarItem(
      icon: Icon(
        icon,
        size: CustomSizes.icon_size_6,
        color: isSelected ? CustomColors.blue : CustomColors.grey,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
              color: isSelected ? CustomColors.blue : CustomColors.grey,
            ),
      ),
      selectedColor: CustomColors.blue,
    );
  }
}
