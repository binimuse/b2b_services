import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 100.h,
              width: 70.w,
              decoration: const BoxDecoration(
                color: Colors.blue,
                boxShadow: [BoxShadow(color: Colors.black45)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 2.h,
            horizontal: 2.w,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 2.h * 0.8,
              ),
              SizedBox(width: 4.w),
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
