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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: deviceHeight * 0.1,
                  ),
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
                height: deviceHeight * 0.35,
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
      ),
    );
  }
}

class MyForm extends ConsumerStatefulWidget {
  // final LoginController loginController;

  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends ConsumerState<MyForm> {
  TextEditingController phoneNumber = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(deviceWidth * 0.1),
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
                  phoneNumber = phone.completeNumber as TextEditingController;
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
                      .requestOTP(phoneNumber.text);
                  print(response.toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationPage(
                        phoneNumber: phoneNumber.text,
                      ),
                    ),
                  );
                }
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Pallete.secondaryColor,
                    borderRadius: BorderRadius.circular(deviceWidth * 0.02),
                  ),
                  width: deviceWidth * 0.8,
                  height: deviceHeight * 0.05,
                  child: const Center(
                      child: Text(
                    'Send OTP',
                    style: TextStyle(color: Pallete.primaryColor),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
