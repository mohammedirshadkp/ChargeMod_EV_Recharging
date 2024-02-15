import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../home/screen/home_page.dart';

final loginRepositoryProvider = Provider((ref) => LoginRepository());

class LoginRepository {
  final String baseUrl = 'https://as-uat.console.chargemod.com';
  final String baseEndpoint =
      '/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0';

  Future<Map<String, dynamic>> _makePostRequest(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed request with status: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>?> requestOTP(String phoneNumber) async {
    try {
      var request = http.Request(
        'POST',
        Uri.parse(
          'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/'
          '64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/signIn',
        ),
      );

      request.headers['Content-Type'] = 'application/json';
      request.body = jsonEncode({'mobile': phoneNumber});

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> data = jsonDecode(responseBody);
        print("details");
        print(data);
        return data;
      } else {
        print('Error: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Exepticn: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> verifyOTP(
      String phoneNumber, int otp, BuildContext context) async {
    try {
      var request = http.Request(
        'POST',
        Uri.parse(
            'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/'
            '64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/verify'),
      );

      request.body =
          '''{  \r\n    "mobile":"$phoneNumber",\r\n    "otp":$otp\r\n}''';

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> data = jsonDecode(responseBody);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ),
        );
        print("Verfction successful");
        return data;
      } else {
        print('Error: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Exept0ion: $e');
      return {'error': e.toString()};
    }
  }

  Future<Map<String, dynamic>> registerUserDetails(
    String phoneNumber,
    String firstName,
    String lastName,
    String email,
  ) async {
    try {
      final endpoint = '$baseUrl$baseEndpoint/register';
      final response = await _makePostRequest(
        endpoint,
        {
          'mobile': phoneNumber,
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
        },
      );
      return response;
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}
