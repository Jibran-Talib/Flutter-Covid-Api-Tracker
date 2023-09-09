import 'dart:async';

import 'package:covid_tracker/view/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _controller,
              child: Container(
                  // color: Colors.black38,
                  height: 200,
                  width: 200,
                  child: const Center(
                    child: Image(
                        image: AssetImage('assets/images/coronavirus.png')),
                  )),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 1.5 * math.pi,
                  child: child,
                );
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          const Align(
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                "Covid 19\nTracker App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 3.h,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                "Developed By Jibran Talib",
                style: TextStyle(
                    color: Colors.pink.shade300,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
