import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Core/Constants.dart';
import 'Core/pallete.dart';
import 'View/Onboard/screen/onboardbase.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextPage();
  }

  void navigateToNextPage() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoardBase(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              navigateToNextPage();
            },
            child: Center(
              child: SvgPicture.asset(
                Constants.chargeMode,
                width: 220,
              ),
            ),
          ),
          const Column(
            children: [
              SizedBox(
                width: 220,
                child: LinearProgressIndicator(
                  color: Pallete.secondaryColor,
                ),
              ),
              SizedBox(height: 10),
              Text("Connecting To ChargeMod"),
            ],
          ),
        ],
      ),
    );
  }
}
