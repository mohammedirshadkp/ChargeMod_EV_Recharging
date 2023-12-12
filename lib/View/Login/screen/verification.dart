import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/login_page_controller.dart';
import 'login_page.dart';

class VerificationPage extends StatefulWidget {
  final LoginController loginController;
  const VerificationPage({super.key, required this.loginController});

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController _otpController = TextEditingController();
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
    // Implement your resend OTP logic here
    // For demonstration, resetting the timer to 30 seconds
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => SizedBox(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                    controller: _otpController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: const InputDecoration(
                      counter: Offstage(),
                      border: OutlineInputBorder(),
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
            SizedBox(height: 20),
            _timerSeconds > 0
                ? Text(
                    'Resend in 00:${_timerSeconds.toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 16),
                  )
                : InkWell(
                    onTap: () {
                      resendOtp();
                    },
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await widget.loginController.verifyOTP(
                    phoneNumber.text, int.parse(_otpController.text));
                print('Entered OTP: ${_otpController.text}');
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
