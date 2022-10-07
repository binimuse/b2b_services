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
          Container(
            height: 35.h,
            // width: 80.w,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.blue,
              boxShadow: [BoxShadow(color: Colors.black45)],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.account_box,
                  size: 13.h,
                  color: Colors.white,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Admasu Adane",
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                    Text(
                      "+251922681360",
                      style: TextStyle(color: Colors.white, fontSize: 11.sp),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.w,
                )
              ],
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          buildRow(
              textcolors: Colors.grey,
              colors: Colors.blue,
              context: context,
              icon: Icons.account_box,
              title: "My Profile",
              onTap: () {}),
          buildRow(
              textcolors: Colors.grey,
              colors: Colors.blue,
              context: context,
              icon: Icons.history,
              title: "History",
              onTap: () {}),
          buildRow(
              textcolors: Colors.grey,
              colors: Colors.blue,
              context: context,
              icon: Icons.settings,
              title: "Settings",
              onTap: () {}),
          buildRow(
              textcolors: Colors.grey,
              colors: Colors.blue,
              context: context,
              icon: Icons.info,
              title: "About",
              onTap: () {}),
          SizedBox(
            height: 9.h,
          ),
          buildRow(
              textcolors: Color.fromARGB(255, 165, 15, 5),
              colors: Color.fromARGB(255, 165, 15, 5),
              context: context,
              icon: Icons.logout,
              title: "Logout",
              onTap: () {}),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ACT IT",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Version 1.01",
                  style: TextStyle(color: Colors.blue, fontSize: 14.sp),
                ),
              ],
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
    required Color colors,
    required Color textcolors,
  }) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 6.w,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: colors,
                    size: 8.w,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: textcolors,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp),
                  ),
                  const Spacer(),
                ],
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
