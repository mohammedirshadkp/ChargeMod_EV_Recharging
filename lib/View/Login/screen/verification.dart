import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irshad/Core/global_variables.dart';
import 'package:irshad/Core/pallete.dart';

import '../../home/screen/home_page.dart';
import '../controller/login_page_controller.dart';
import 'login_page.dart';

class VerificationPage extends ConsumerStatefulWidget {
  final String phoneNumber;
  const VerificationPage({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends ConsumerState<VerificationPage> {
  List<TextEditingController> otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  int _timerSeconds = 30;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void resendOtp() {
    setState(() {
      _timerSeconds = 30;
      startTimer();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: deviceHeight * 0.12,
          title: Text(
            'Verification',
            style: GoogleFonts.poppins(color: Pallete.blackColor),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("We’ve send you the verification ",
                    style: GoogleFonts.poppins(color: Pallete.blackColor)),
                Text("code on +91 ${widget.phoneNumber}",
                    style: GoogleFonts.poppins(color: Pallete.blackColor)),
                SizedBox(
                  height: deviceHeight * 0.15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(
                                0.0,
                                0.0,
                              ),
                              blurRadius: 1.0,
                              spreadRadius: 0.0,
                            )
                          ],
                          color: Colors.white),
                      width: 50,
                      height: 50,
                      child: TextFormField(
                        // showCursor: false,
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        controller: otpControllers[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        decoration: const InputDecoration(
                          counter: Offstage(),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        onChanged: (value) {
                          if (value.length == 1 && index < 3) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _timerSeconds > 0
                    ? Text(
                        'Resend in 00:${_timerSeconds.toString().padLeft(2, '0')}',
                        style: GoogleFonts.poppins(
                            color: Pallete.secondaryColor, fontSize: 17))
                    : InkWell(
                        onTap: () {
                          resendOtp();
                        },
                        child: Text('Resend OTP',
                            style: GoogleFonts.poppins(
                                color: Pallete.secondaryColor, fontSize: 17)),
                      ),
                SizedBox(height: deviceHeight * 0.4),
                InkWell(
                  onTap: () async {
                    String enteredOtp = otpControllers
                        .map((controller) => controller.text)
                        .join(); // Join all OTP digit controllers
                    await ref.read(loginControllerProvider.notifier).verifyOTP(
                        widget.phoneNumber.toString(),
                        int.parse(enteredOtp),
                        context);
                    print('Entered OTP: $enteredOtp');
                  },
                  child: Container(
                    height: deviceHeight * 0.06,
                    width: deviceWidth * 0.7,
                    decoration: BoxDecoration(
                        color: Pallete.secondaryColor,
                        borderRadius:
                            BorderRadius.circular(deviceWidth * 0.05)),
                    child: Center(
                      child: Text('Continue',
                          style:
                              GoogleFonts.poppins(color: Pallete.primaryColor)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
