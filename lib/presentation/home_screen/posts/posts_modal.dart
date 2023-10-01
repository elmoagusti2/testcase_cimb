import 'package:cimb_testcase/models/posts/posts.dart';
import 'package:cimb_testcase/presentation/widget/bottom_sheet.dart';
import 'package:flutter/material.dart';

class ModalPosts {
  static detials({required context, required Posts posts}) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (context) => BottomSheetWidget.baseSheet(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: Text(
                "${posts.title}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Text(
                "${posts.body}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
        withTopIndicator: true,
      ),
    );
  }
}
