import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:irshad/Core/Constants.dart';
import 'package:irshad/Core/global_variables.dart';

class OnBoard1 extends StatefulWidget {
  const OnBoard1({Key? key}) : super(key: key);
  @override
  State<OnBoard1> createState() => _OnBoard1State();
}

class _OnBoard1State extends State<OnBoard1> {
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
            Constants.atyourefingertips,
            // color: Colors.yellow,
            width: deviceWidth * 0.5,
          ),
        ),
        SizedBox(
          height: deviceHeight * 0.46,
        ),
        const Text("Scan Charge And Go"),
        const Text("Effortless Charging Schemas"),
        SizedBox(
          height: deviceHeight * 0.038,
        ),
      ],
    );
  }
}
