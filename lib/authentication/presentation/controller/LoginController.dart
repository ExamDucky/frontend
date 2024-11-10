import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_usb_desktop/authentication/data/AuthRepository.dart';

class LoginController extends StateNotifier<AsyncValue<dynamic>> {
  LoginController({required this.authRepository})
      : super(const AsyncData<void>(null));

  final AuthRepository authRepository;

  Future<dynamic> login(
      {required String email, required String password}) async {
    state = const AsyncLoading<dynamic>();
    state = await AsyncValue.guard<dynamic>(() => authRepository.postLogin(
          email: email,
          password: password,
        ));
  }
}
