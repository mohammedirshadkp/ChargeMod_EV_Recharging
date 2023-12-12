import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Core/Constants.dart';
import '../../../Core/global_variables.dart';

class OnBoard2 extends StatefulWidget {
  const OnBoard2({super.key});
  @override
  State<OnBoard2> createState() => _OnBoard2State();
}

class _OnBoard2State extends State<OnBoard2> {
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
            Constants.travelRoute,
            // color: Colors.yellow,
            width: deviceWidth * 0.5,
          ),
        ),
        SizedBox(
          height: deviceHeight * 0.46,
        ),
        const Text("Grab The Best In Class"),
        const Text("Digital Experience Crafted For"),
        const Text("EV Drivers"),
        SizedBox(
          height: deviceHeight * 0.04,
        ),
      ],
    );
  }
}
