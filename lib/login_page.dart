import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:irshad/core/pallete.dart';
import 'package:irshad/verification.dart';

import 'core/Constants.dart';
import 'core/global_variables.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
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
                MyForm(),
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

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
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
            // Other form fields if needed...
            IntlPhoneField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              onChanged: (phone) {
                setState(() {
                  _phoneNumber = phone.completeNumber;
                });
              },
              initialCountryCode: 'IN', // Initial selection country code
              // autoValidate: true,
              validator: (value) {
                if (value == null) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationPage(),
                    ));
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Pallete.secondaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: deviceWidth * 0.8,
                  height: deviceHeight * 0.05,
                  child: Center(child: Text('Sent Otp')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
