import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:irshad/core/pallete.dart';
import 'package:irshad/View/Login/screen/verification.dart';
import 'package:http/http.dart' as http;
import '../../../core/Constants.dart';
import '../../../core/global_variables.dart';
import '../controller/login_page_controller.dart';
import '../repository/login_page_repository.dart';

TextEditingController phoneNumber = TextEditingController();
//
// class Login extends ConsumerStatefulWidget {
//   const Login({super.key});
//
//   @override
//   ConsumerState<Login> createState() => _LoginState();
// }
//
// class _LoginState extends ConsumerState<Login> {
//   @override
//   Widget build(BuildContext context) {
//     final repository = ref.read(loginRepositoryProvider);
//     final LoginController _loginController = LoginController(repository);
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
//                 MyForm(
//                   loginController: _loginController,
//                 ),
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
//                       .registerUserDetails(_phoneNumber!, "irshad", "mohammed",
//                           "email@gmail.com");
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
//                       color: Pallete.secondaryColor,
//                       borderRadius: BorderRadius.circular(10)),
//                   width: deviceWidth * 0.8,
//                   height: deviceHeight * 0.05,
//                   child: Center(child: Text('Sent Otp')),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  Future<Map<String, dynamic>> registerUserDetails(
    String phoneNumber,
    String firstName,
    String lastName,
    String email,
  ) async {
    const baseUrl = 'https://as-uat.console.chargemod.com/';
    const baseEndpoint =
        'temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/register';

    try {
      final response = await http.post(
        Uri.parse('$baseUrl$baseEndpoint'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'mobile': phoneNumber,
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Failed request with status: ${response.statusCode}');
      }
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final response = await registerUserDetails(
              '1234567890', // Replace with actual details
              'John',
              'Doe',
              'john@example.com',
            );

            if (response.containsKey('error')) {
              // Handle error
              print('Error occurred: ${response['error']}');
            } else {
              // Registration was successful
              // Access the data from the response
              print('Registration successful: $response');
            }
          },
          child: Text('Register'),
        ),
      ),
    );
  }
}
