// // ... (existing imports and variables)
//
// class VerificationPage extends StatefulWidget {
//   final LoginController loginController;
//
//   const VerificationPage({required this.loginController});
//
//   @override
//   _VerificationPageState createState() => _VerificationPageState();
// }
//
// class _VerificationPageState extends State<VerificationPage> {
//   TextEditingController _otpController = TextEditingController();
//   int _timerSeconds = 30;
//   late Timer _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }
//
//   void startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_timerSeconds > 0) {
//           _timerSeconds--;
//         } else {
//           _timer.cancel();
//         }
//       });
//     });
//   }
//
//   void resendOtp() {
//     // Implement your resend OTP logic here
//     // For demonstration, resetting the timer to 30 seconds
//     setState(() {
//       _timerSeconds = 30;
//       startTimer();
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Verification'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: List.generate(
//                 4,
//                 (index) => SizedBox(
//                   width: 50,
//                   height: 50,
//                   child: TextFormField(
//                       // ... (existing TextFormField setup)
//                       ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             _timerSeconds > 0
//                 ? Text(
//                     // ... (existing resend OTP text)
//                     )
//                 : InkWell(
//                     onTap: () {
//                       resendOtp();
//                     },
//                     child: Text(
//                         // ... (existing resend text)
//                         ),
//                   ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 await widget.loginController.verifyOTP(
//                   phoneNumber.text, // Get entered OTP from TextFormField
//                 );
//                 // Handle navigation or other logic after OTP verification
//               },
//               child: Text('Continue'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
