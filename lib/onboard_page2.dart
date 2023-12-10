import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'core/Constants.dart';

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
            Constants.travelRoute,
            // color: Colors.yellow,
            width: 220,
          ),
        ),
        const SizedBox(
          height: 380,
        ),
        const Text("Grab The Best In Class"),
        const Text("Digital Experience Crafted For"),
        const Text("EV Drivers\n"),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 270,
      child: SvgPicture.asset(
        Constants.map,
        width: 300,
      ),
    );
  }
}
