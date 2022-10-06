import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/config/theme/custom_sizes.dart';
import 'package:b2b_services/app/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  SplashController splashController = Get.find<SplashController>();

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );

    _animation1 = Tween<double>(
      begin: 0.0,
      end: 100.0,
    ).animate(_controller1);

    _animation2 = Tween<double>(
      begin: 0.0,
      end: 100.0,
    ).animate(_controller2);

    _controller1.addListener(() {
      setState(() {});
    });

    _controller2.addListener(() {
      setState(() {});
    });

    _controller1.forward();

    _controller2.forward().whenCompleteOrCancel(() {
      Future.delayed(const Duration(milliseconds: 1500), () {
        splashController.checkIfLogin();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller2.dispose();
    _controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: CustomColors.blue),
      child: Scaffold(
        backgroundColor: CustomColors.blue,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: CustomSizes.mp_v_10 * 2,
              ),
              Opacity(
                opacity: _controller1.value,
                child: Transform.translate(
                  offset: Offset(0, -_animation1.value * 1.5),
                  child: Text(
                    "ACT",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: CustomColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: CustomSizes.font_26 * 2,
                        ),
                  ),
                ),
              ),
              Opacity(
                opacity: _controller2.value,
                child: Transform.translate(
                  offset: Offset(0, -_animation2.value * 1.6),
                  child: Text(
                    "B2B",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: CustomColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
