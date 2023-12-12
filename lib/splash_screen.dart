import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:irshad/core/pallete.dart';
import 'package:irshad/View/Onboard/screen/onboard_page1.dart';
import 'package:irshad/View/Onboard/screen/onboardbase.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'core/Constants.dart';
import 'core/global_variables.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Pallete.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnBoardBase(),
                    ));
              },
              child: Center(
                child: SvgPicture.asset(
                  Constants.chargeMode,
                  width: 220,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  width: 220,
                  child: LinearProgressIndicator(
                    color: Pallete.secondaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Connecting To ChargeMod"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
