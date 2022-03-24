import 'dart:async';
// ignore: unused_import

import 'onboading_screen.dart';
import 'package:show_up_animation/show_up_animation.dart';

// ignore: unused_import
import 'login_screen.dart';

import '../common_import.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // ignore: must_call_super
  void initState() {
    Future.delayed(Duration(milliseconds: 2500))
        .then((value) => Get.off(() => LoginScreenBluetooth()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShowUpAnimation(
          child: SizedBox(
            width: Get.width / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: kPrimaryColor,
                ),
                // Image.asset('assets/logo.png'),
                Text('Splash Screen'),
              ],
            ),
          ),
          delayStart: Duration(milliseconds: 500),
          animationDuration: Duration(milliseconds: 1000),
          curve: Curves.bounceIn,
          direction: Direction.vertical,
          offset: 0.5,
        ),
      ),
    );
  }
}
