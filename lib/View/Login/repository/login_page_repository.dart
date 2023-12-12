import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final loginRepositoryProvider = Provider((ref) => LoginRepository());

class LoginRepository {
  final String baseUrl = 'https://as-uat.console.chargemod.com/';
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

  Future<Map<String, dynamic>> requestOTP(String phoneNumber) async {
    // var request = http.Request(
    //     'POST',
    //     Uri.parse(
    //         'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/1.0.0/signIn'));
    // request.body = '''{\r\n    "mobile":"7592072890"\r\n}''';
    //
    // http.StreamedResponse response = await request.send();
    //
    // if (response.statusCode == 200) {
    //   return await response.stream.bytesToString();
    // } else {
    //   return response.reasonPhrase;
    //   // return null;
    // }
    try {
      final endpoint = '$baseEndpoint/verify';
      print(endpoint);
      final response = await _makePostRequest(
        endpoint,
        {'mobile': phoneNumber},
      );
      return response;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  Future<Map<String, dynamic>> verifyOTP(
    String phoneNumber,
    int otp,
  ) async {
    try {
      final endpoint = '$baseEndpoint/verify';
      final response = await _makePostRequest(
        endpoint,
        {'mobile': phoneNumber, 'otp': otp},
      );
      return response;
    } catch (e) {
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
