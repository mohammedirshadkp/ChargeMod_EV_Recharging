import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/Constants.dart';
import '../../../core/global_variables.dart';

class OnBoard3 extends StatefulWidget {
  const OnBoard3({super.key});

  @override
  State<OnBoard3> createState() => _OnBoard3State();
}

class _OnBoard3State extends State<OnBoard3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: deviceHeight * 0.015,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(deviceHeight * 0.02),
              child: Text(
                "SKIP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: deviceHeight * 0.08,
        ),
        Center(
          child: SvgPicture.asset(
            Constants.Realtime,
            // color: Colors.yellow,
            width: deviceWidth * 0.5,
          ),
        ),
        SizedBox(
          height: deviceHeight * 0.46,
        ),
        const Text("Inteligent Sensible Devices"),
        const Text("Ambi Charge series"),
        SizedBox(
          height: deviceHeight * 0.048,
        ),
      ],
    );
  }
}

class Charger2 extends StatelessWidget {
  const Charger2({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: deviceHeight * 0.32,
      child: SvgPicture.asset(
        Constants.charger,
        width: deviceWidth * 0.8,
      ),
    );
  }
}
