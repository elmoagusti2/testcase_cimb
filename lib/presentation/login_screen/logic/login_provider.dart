import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/enum.dart';
import '../../../common/regex.dart';
import '../../../models/states/login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier()
      : super(LoginState(state: RequestState.empty, visiblePassword: true));

  void login({required email, required password}) {
    state = state.copyWith(state: RequestState.loading);
    Future.delayed(const Duration(milliseconds: 500), (() {
      if (RegularExpressions.email.hasMatch(email) &&
          RegularExpressions.password.hasMatch(password)) {
        state = state.copyWith(state: RequestState.success, password: password);
        state = LoginState(state: RequestState.empty);
      } else {
        state = state.copyWith(state: RequestState.error, password: password);
      }
    }));
  }

  void showPassword() {
    state = state.copyWith(
        visiblePassword: state.visiblePassword == true ? false : true,
        state: RequestState.empty);
  }
}

final loginStateProvider =
    StateNotifierProvider<LoginNotifier, LoginState>((ref) => LoginNotifier());
