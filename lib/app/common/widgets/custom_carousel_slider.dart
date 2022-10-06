import 'dart:async';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/config/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class CarouselSlider extends StatefulWidget {
  const CarouselSlider({
    Key? key,
    required this.height,
    required this.children,
    required this.scrollDuration,
    required this.dotTopMargin,
    required this.autoScroll,
    required this.onPageChanged, required this.onPageControllerInit,
  }) : super(key: key);

  final double? height;
  final List<Widget> children;
  final Duration scrollDuration;
  final double dotTopMargin;
  final bool autoScroll;
  final Function(int page) onPageChanged;
  final Function(PageController controller) onPageControllerInit;

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  _CarouselSliderState();

  ///NOTIFIER FOR DOTED INDICATOR
  late ValueNotifier<int> pageNotifier;

  ///CONTROLLER FOR PAGE VIEW
  late PageController controller;

  ///TIMER FOR CAROUSEL
  late Timer timer;

  ///PAGER CURRENT PAGE
  int currentPage = 0;

  @override
  void initState() {
    ///PAGE VIEW CONTROLLER INIT
    controller = PageController(
      initialPage: 0,
      viewportFraction: ScreenUtil().isPhone() ? 1.0 : 0.8,
    );

    widget.onPageControllerInit(controller);

    ///INDICATOR CONTROLLER INIT
    pageNotifier = ValueNotifier<int>(0);

    ///CAROUSEL TIMER INIT
    timer = Timer.periodic(const Duration(seconds: 8), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      if (widget.autoScroll) {
        controller.animateToPage(
          currentPage,
          duration: widget.scrollDuration,
          curve: Curves.easeIn,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: CustomSizes.mp_v_1 / 2,
          ),
          Expanded(
            child: PageView(
              controller:
              controller,
              onPageChanged: (index) {
                setState(() {
                  pageNotifier.value = index;
                  currentPage = index;
                });
                widget.onPageChanged(currentPage);
              },
              children: widget.children,
            ),
          ),
          SizedBox(
            height: widget.dotTopMargin,
          ),
          SmoothPageIndicator(
            controller: controller, // PageController
            count: widget.children.length,
            effect: ExpandingDotsEffect(
              dotHeight: CustomSizes.mp_v_1,
              dotWidth: CustomSizes.mp_w_2,
              activeDotColor: CustomColors.blue,
              dotColor: CustomColors.lightGrey,
            ),
            onDotClicked: (index) {
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
          SizedBox(
            height: CustomSizes.mp_v_2 * 0.8,
          ),
        ],
      ),
    );
  }
}
