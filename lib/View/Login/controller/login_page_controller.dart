import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/screen/home_page.dart';
import '../repository/login_page_repository.dart';

final loginControllerProvider =
    StateNotifierProvider<LoginController, AsyncValue<Map<String, dynamic>>>(
  (ref) {
    final repository = ref.read(loginRepositoryProvider);
    return LoginController(repository);
  },
);

class LoginController extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final LoginRepository _repository;

  LoginController(this._repository) : super(const AsyncValue.loading());

  Future<Map<String, dynamic>?> requestOTP(String phoneNumber) async {
    try {
      final result = await _repository.requestOTP(phoneNumber);
      state = AsyncValue.data(result!);
      return result;
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
    return null;
  }

  Future<void> verifyOTP(
      String phoneNumber, int otp, BuildContext context) async {
    try {
      final result = await _repository.verifyOTP(phoneNumber, otp, context);

      state = AsyncValue.data(result!);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> registerUserDetails(
    String phoneNumber,
    String firstName,
    String lastName,
    String email,
  ) async {
    try {
      final result = await _repository.registerUserDetails(
        phoneNumber,
        firstName,
        lastName,
        email,
      );
      state = AsyncValue.data(result);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
