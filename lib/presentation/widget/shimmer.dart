import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPosts extends StatelessWidget {
  const ShimmerPosts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        width: 200.0,
        height: 55.0,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
        child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey,
            child: Container(
              height: 20,
              width: 20,
              // color: Colors.amber,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            )),
      ),
    );
  }
}
