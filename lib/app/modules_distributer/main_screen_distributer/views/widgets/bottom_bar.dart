import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  final int currentIndex;
  final Function(int index) onTap;

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
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          ///INCOMING
          buildBottomBarTab(
            context,
            isSelected: currentIndex == 0,
            text: 'Incoming',
            selectedIcon: FontAwesomeIcons.solidHourglassStart,
            unselectedIcon: FontAwesomeIcons.hourglassStart,
          ),

          ///INCOMING
          buildBottomBarTab(
            context,
            isSelected: currentIndex == 1,
            text: 'Confirmed',
            selectedIcon: FontAwesomeIcons.solidFolderArrowDown,
            unselectedIcon: FontAwesomeIcons.folderArrowDown,
          ),

          ///INCOMING
          buildBottomBarTab(
            context,
            isSelected: currentIndex == 2,
            text: 'Shipped',
            selectedIcon: FontAwesomeIcons.solidTruckFast,
            unselectedIcon: FontAwesomeIcons.truckFast,
          ),

          ///INCOMING
          buildBottomBarTab(
            context,
            isSelected: currentIndex == 3,
            text: 'Delivred',
            selectedIcon: FontAwesomeIcons.solidBoxCheck,
            unselectedIcon: FontAwesomeIcons.boxCheck,
          ),
        ],
      ),
    );
  }

  buildBottomBarTab(
    context, {
    required bool isSelected,
    required String text,
    required IconData selectedIcon,
    required IconData unselectedIcon,
  }) {
    return SalomonBottomBarItem(
      icon: Icon(
        isSelected?selectedIcon : unselectedIcon,
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
