import 'package:flutter/material.dart';

class BottomSheetWidget {
  static Widget _topIndicator() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        height: 5,
        width: 80,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      ),
    );
  }

  static Widget baseSheet({
    required Widget child,
    EdgeInsets? contentPadding = const EdgeInsets.symmetric(
      horizontal: 24,
    ),
    bool withTopIndicator = true,
  }) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.zero,
      child: Container(
        constraints: const BoxConstraints(minHeight: 150),
        padding: contentPadding,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(visible: withTopIndicator, child: _topIndicator()),
            Flexible(child: child),
          ],
        ),
      ),
    );
  }
}
