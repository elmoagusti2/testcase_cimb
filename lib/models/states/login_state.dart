import '../../common/enum.dart';

class LoginState {
  String? email;
  String? password;
  bool? visiblePassword;
  RequestState? state;

  LoginState({
    this.email,
    this.password,
    this.visiblePassword,
    required this.state,
  });

  LoginState copyWith(
      {String? email,
      String? password,
      bool? visiblePassword,
      RequestState? state}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        visiblePassword: visiblePassword ?? this.visiblePassword,
        state: state ?? this.state);
  }
}
