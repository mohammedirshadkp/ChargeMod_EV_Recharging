// // ... (existing imports and variables)
//
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   final LoginController _loginController = LoginController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Pallete.primaryColor,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Column(
//               children: [
//                 Center(
//                   child: SvgPicture.asset(
//                     Constants.Letstatrtlogin,
//                     width: deviceWidth * 0.6,
//                   ),
//                 ),
//                 MyForm(loginController: _loginController),
//               ],
//             ),
//             SizedBox(
//               height: deviceHeight * 0.1,
//             ),
//             const Column(
//               children: [
//                 Text("By Continuing You Agree To Our"),
//                 Text("Termas And Conditions  And Privacy And Policy"),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MyForm extends StatefulWidget {
//   final LoginController loginController;
//
//   const MyForm({required this.loginController});
//
//   @override
//   _MyFormState createState() => _MyFormState();
// }
//
// class _MyFormState extends State<MyForm> {
//   final _formKey = GlobalKey<FormState>();
//   String? _phoneNumber;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(40),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             IntlPhoneField(
//                 // ... (existing IntlPhoneField setup)
//                 ),
//             InkWell(
//               onTap: () async {
//                 if (_formKey.currentState!.validate()) {
//                   await widget.loginController.requestOTP(_phoneNumber!);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => VerificationPage(
//                         loginController: widget.loginController,
//                       ),
//                     ),
//                   );
//                 }
//               },
//               child: Center(
//                 child: Container(
//                     // ... (existing button setup)
//                     ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
