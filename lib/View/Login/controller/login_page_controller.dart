import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  Future<void> requestOTP(String phoneNumber) async {
    try {
      final result = await _repository.requestOTP(phoneNumber);
      print('success');
      print('success');
      print('success');
      print('success');
      print('success');
      print('success');
      print('success');
      print('success');
      state = AsyncValue.data(result);
    } catch (e, stackTrace) {
      print('failed');
      print('failed');
      print('failed');
      print('failed');
      print('failed');
      print('failed');
      print('failed');
      print('failed');
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> verifyOTP(String phoneNumber, int otp) async {
    try {
      final result = await _repository.verifyOTP(phoneNumber, otp);
      state = AsyncValue.data(result);
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
