import 'package:cimb_testcase/presentation/widget/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ModalCustom {
  static error({required context, required message}) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (context) => BottomSheetWidget.baseSheet(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LottieBuilder.asset(
                repeat: false,
                'assets/lottie/error.json',
                width: 150,
                height: 150),
            Text(
              message,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
        withTopIndicator: true,
      ),
    );
  }
}
