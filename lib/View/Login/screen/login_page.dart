import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:irshad/Core/pallete.dart';
import 'package:irshad/View/Login/screen/verification.dart';
import 'package:http/http.dart' as http;
import '../../../Core/Constants.dart';
import '../../../Core/global_variables.dart';
import '../controller/login_page_controller.dart';
import '../repository/login_page_repository.dart';

TextEditingController phoneNumber = TextEditingController();

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  Widget build(BuildContext context) {
    final repository = ref.read(loginRepositoryProvider);
    final LoginController _loginController = LoginController(repository);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Pallete.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Center(
                  child: SvgPicture.asset(
                    Constants.Letstatrtlogin,
                    width: deviceWidth * 0.6,
                  ),
                ),
                MyForm(
                  loginController: _loginController,
                ),
              ],
            ),
            SizedBox(
              height: deviceHeight * 0.1,
            ),
            const Column(
              children: [
                Text("By Continuing You Agree To Our"),
                Text("Termas And Conditions  And Privacy And Policy"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//
// class MyForm extends ConsumerStatefulWidget {
//   final LoginController loginController;
//
//   const MyForm({super.key, required this.loginController});
//   @override
//   _MyFormState createState() => _MyFormState();
// }
//
// class _MyFormState extends ConsumerState<MyForm> {
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
//             // Other form fields if needed...
//             IntlPhoneField(
//               controller: phoneNumber,
//               decoration: const InputDecoration(
//                 labelText: 'Phone Number',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (phone) {
//                 setState(() {
//                   _phoneNumber = phone.completeNumber;
//                 });
//               },
//               initialCountryCode: 'IN', // Initial selection country code
//               // autoValidate: true,
//               validator: (value) {
//                 if (value == null) {
//                   return 'Please enter a valid phone number';
//                 }
//                 return null;
//               },
//             ),
//             InkWell(
//               onTap: () async {
//                 if (_formKey.currentState!.validate()) {
//                   // await widget.loginController.requestOTP(_phoneNumber!);
//                   final response = ref
//                       .read(loginControllerProvider.notifier)
//                       .requestOTP(_phoneNumber!);
//                   print(response.toString());
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
//                   decoration: BoxDecoration(
//                     color: Pallete.secondaryColor,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   width: deviceWidth * 0.8,
//                   height: deviceHeight * 0.05,
//                   child: const Center(child: Text('Sent Otp')),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class MyForm extends ConsumerStatefulWidget {
  final LoginController loginController;

  const MyForm({Key? key, required this.loginController}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends ConsumerState<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntlPhoneField(
              controller: phoneNumber,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              onChanged: (phone) {
                setState(() {
                  _phoneNumber = phone.completeNumber;
                });
              },
              initialCountryCode: 'IN',
              validator: (value) {
                if (value == null) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),
            InkWell(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  final response = await ref
                      .read(loginControllerProvider.notifier)
                      .requestOTP(_phoneNumber!);
                  print(response.toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationPage(
                        loginController: widget.loginController,
                      ),
                    ),
                  );
                }
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Pallete.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: deviceWidth * 0.8,
                  height: deviceHeight * 0.05,
                  child: Center(child: Text('Send OTP')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
