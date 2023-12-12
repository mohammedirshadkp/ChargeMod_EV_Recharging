import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:irshad/Core/Constants.dart';
import 'package:irshad/Core/global_variables.dart';
import 'package:irshad/Core/pallete.dart';
import 'package:irshad/View/Onboard/screen/onboard_page2.dart';
import '../../Login/screen/login_page.dart';
import 'onboard_page1.dart';
import 'onboard_page3.dart';

class OnBoardBase extends ConsumerStatefulWidget {
  const OnBoardBase({Key? key}) : super(key: key);
  @override
  ConsumerState<OnBoardBase> createState() => _OnBoard1State();
}

class _OnBoard1State extends ConsumerState<OnBoardBase> {
  final selectedIndex = StateProvider<int>((ref) => 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: SvgPicture.asset(
                Constants.onBoardWhiteBG,
                fit: BoxFit.fitWidth,
                color: Colors.grey,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ref.watch(selectedIndex) == 0 ? OnBoard1() : SizedBox(),
                ref.watch(selectedIndex) == 1 ? OnBoard2() : SizedBox(),
                ref.watch(selectedIndex) == 2 ? OnBoard3() : SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ref.watch(selectedIndex) == 0
                        ? CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.transparent,
                          )
                        : InkWell(
                            onTap: () {
                              if (ref.watch(selectedIndex) > 0) {
                                ref.read(selectedIndex.notifier).state--;
                              }
                            },
                            child: const CircleAvatar(
                              radius: 28,
                              backgroundColor: Pallete.secondaryColor,
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                color: Pallete.primaryColor,
                              ),
                            ),
                          ),
                    SizedBox(
                      width: deviceWidth * 0.05,
                    ),
                    Container(
                      height: deviceHeight * 0.1,
                      width: deviceWidth * 0.25,
                      color: Colors.transparent,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          // shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: deviceWidth * 0.09,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(deviceWidth * 0.005),
                                  child: Consumer(builder: (
                                    context,
                                    ref,
                                    child,
                                  ) {
                                    int isSelected = ref.watch(selectedIndex);
                                    return InkWell(
                                      onTap: () {
                                        ref
                                            .watch(selectedIndex.notifier)
                                            .update((state) => index);
                                      },
                                      child: Row(
                                        children: [
                                          isSelected == index
                                              ? Icon(
                                                  Icons.circle,
                                                  color: Pallete.blackColor,
                                                  size: deviceHeight * 0.02,
                                                )
                                              : Icon(
                                                  Icons.circle,
                                                  color: Pallete.blackColor,
                                                  size: deviceHeight * 0.012,
                                                ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      width: deviceWidth * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        if (ref.watch(selectedIndex) < 2) {
                          ref.read(selectedIndex.notifier).state++;
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ));
                        }
                      },
                      child: const CircleAvatar(
                        radius: 28,
                        backgroundColor: Pallete.secondaryColor,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Pallete.primaryColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            ref.watch(selectedIndex) == 0 ? Scooter() : SizedBox(),
            ref.watch(selectedIndex) == 1 ? Map() : SizedBox(),
            ref.watch(selectedIndex) == 2 ? Charger2() : SizedBox()
          ],
        ),
      ),
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

class Map extends StatelessWidget {
  const Map({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: deviceHeight * 0.32,
      child: SvgPicture.asset(
        Constants.map,
        width: deviceWidth * 0.8,
      ),
    );
  }
}

class Scooter extends StatelessWidget {
  const Scooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: deviceHeight * 0.32,
      left: -deviceWidth * 0.35,
      child: SvgPicture.asset(
        Constants.scootercharger,
        width: deviceWidth * 1.28,
      ),
    );
  }
}
