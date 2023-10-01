import 'package:cimb_testcase/common/colors.dart';
import 'package:cimb_testcase/common/transition.dart';
import 'package:cimb_testcase/presentation/home_screen/home_screen.dart';
import 'package:cimb_testcase/presentation/login_screen/logic/login_provider.dart';
import 'package:cimb_testcase/presentation/login_screen/login_button.dart';
import 'package:cimb_testcase/presentation/widget/modal_custom.dart';
import 'package:cimb_testcase/presentation/widget/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/enum.dart';
import '../widget/loading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Consumer(builder: (context, ref, child) {
      ref.listen(loginStateProvider, (previous, next) {
        switch (next.state) {
          case RequestState.error:
            String message = 'Please check email format and length password';
            ModalCustom.error(context: context, message: message);
            break;
          case RequestState.success:
            Navigator.of(context).push(RipplePageTransition(
              page: const WithLoading(go: HomeScreen()),
            ));
            break;
          default:
        }
      });
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: ConstColors.hexToColors('a70103'),
          padding: const EdgeInsets.all(20),
          child: Center(
              child: FormLogin(
            context: context,
            txtEmail: txtEmail,
            txtPassword: txtPassword,
          )),
        ),
      );
    });
  }
}

class FormLogin extends ConsumerWidget {
  const FormLogin(
      {super.key,
      required this.context,
      required this.txtEmail,
      required this.txtPassword});

  final BuildContext context;
  final TextEditingController txtEmail;
  final TextEditingController txtPassword;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool? visiblePassword = ref.watch(loginStateProvider).visiblePassword;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('OCTO',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w900))
            .animate(onPlay: (controller) => controller.repeat(reverse: true))
            .shimmer(
                color: Colors.red[300], duration: const Duration(seconds: 2)),
        const SizedBox(height: 52),
        TextFormCustom.email(txtEmail: txtEmail),
        const SizedBox(height: 12),
        TextFormCustom.password(
            txtPassword: txtPassword,
            visiblePassword: visiblePassword ?? true,
            showPassword: () =>
                ref.read(loginStateProvider.notifier).showPassword()),
        const SizedBox(
          height: 40,
        ),
        ButtonLogin(txtEmail: txtEmail, txtPassword: txtPassword)
      ],
    );
  }
}
