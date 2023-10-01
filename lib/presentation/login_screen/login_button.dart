import 'package:cimb_testcase/presentation/login_screen/logic/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/colors.dart';
import '../../common/enum.dart';

class ButtonLogin extends ConsumerWidget {
  const ButtonLogin({
    super.key,
    required this.txtEmail,
    required this.txtPassword,
  });

  final TextEditingController txtEmail;
  final TextEditingController txtPassword;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 500,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 10,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: () => ref
            .read(loginStateProvider.notifier)
            .login(email: txtEmail.text, password: txtPassword.text),
        child: ref.watch(loginStateProvider).state == RequestState.loading
            ? SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  color: ConstColors.hexToColors('a70103'),
                ),
              )
            : Text(
                'Log In',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ConstColors.hexToColors('a70103')),
              ),
      ),
    );
  }
}
