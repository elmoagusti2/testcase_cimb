import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../common/transition.dart';

class WithLoading extends StatefulWidget {
  final Widget go;
  const WithLoading({
    Key? key,
    required this.go,
  }) : super(key: key);

  @override
  State<WithLoading> createState() => _WithLoadingState();
}

class _WithLoadingState extends State<WithLoading> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () => Navigator.of(context).pushAndRemoveUntil(
          RipplePageTransition(page: widget.go),
          (Route<dynamic> route) => false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
            alignment: Alignment.center,
            child: LottieBuilder.asset('assets/lottie/cimb_niaga.json',
                height: 250)),
        Align(
            alignment: const Alignment(0, 0.30),
            child:
                LottieBuilder.asset('assets/lottie/loading.json', height: 20))
      ],
    ));
  }
}
