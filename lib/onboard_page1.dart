import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:irshad/core/Constants.dart';

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
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "SKIP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
          child: SvgPicture.asset(
            Constants.atyourefingertips,
            // color: Colors.yellow,
            width: 220,
          ),
        ),
        const SizedBox(
          height: 380,
        ),
        const Text("Scan Charge And Go"),
        const Text("Effortless Charging Schemas"),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class Scooter extends StatelessWidget {
  const Scooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 270,
      left: -140,
      child: SvgPicture.asset(
        Constants.scooter,
        width: 400,
      ),
    );
  }
}

class Charger extends StatelessWidget {
  const Charger({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 25,
      bottom: 350,
      child: SvgPicture.asset(
        Constants.charger,
        width: 200,
      ),
    );
  }
}
