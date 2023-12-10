import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:irshad/core/Constants.dart';
import 'package:irshad/core/global_variables.dart';
import 'package:irshad/core/pallete.dart';
import 'package:irshad/onboard_page2.dart';
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
                              ref
                                  .read(selectedIndexProvider.notifier)
                                  .goToNextPage();
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
                                                  size: 20,
                                                )
                                              : const Icon(
                                                  Icons.circle,
                                                  color: Pallete.blackColor,
                                                  size: 12,
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
                    ref.watch(selectedIndex) == 3
                        ? SizedBox()
                        : InkWell(
                            onTap: () {
                              ref
                                  .read(selectedIndexProvider.notifier)
                                  .goToPreviousPage();
                            },
                            child: const CircleAvatar(
                              radius: 28,
                              backgroundColor: Pallete.secondaryColor,
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Pallete.primaryColor,
                              ),
                            ),
                          )
                  ],
                )
              ],
            ),
            ref.watch(selectedIndex) == 0 ? Scooter() : SizedBox(),
            ref.watch(selectedIndex) == 0 ? Charger() : SizedBox(),
            ref.watch(selectedIndex) == 1 ? Map() : SizedBox()
          ],
        ),
      ),
    );
  }
}

class SelectedIndexNotifier extends StateNotifier<int> {
  SelectedIndexNotifier() : super(0);

  void goToNextPage() {
    if (state < 2) {
      state++;
    }
  }

  void goToPreviousPage() {
    if (state > 0) {
      state--;
    }
  }
}

final selectedIndexProvider =
    StateNotifierProvider<SelectedIndexNotifier, int>((ref) {
  return SelectedIndexNotifier();
});
