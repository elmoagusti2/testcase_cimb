import 'package:cimb_testcase/models/posts/posts.dart';
import 'package:cimb_testcase/presentation/home_screen/logic/home_provider.dart';
import 'package:cimb_testcase/presentation/home_screen/posts/posts_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';

class CardPosts extends ConsumerWidget {
  const CardPosts({
    super.key,
    required this.posts,
    required this.screenWidth,
    required this.startAnimation,
  });

  final double screenWidth;
  final bool startAnimation;
  final Posts posts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => ModalPosts.detials(
        context: context,
        posts: posts,
      ),
      child: AnimatedContainer(
        height: 55,
        width: screenWidth,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        transform:
            Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
        margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
        padding:
            EdgeInsets.symmetric(horizontal: screenWidth / 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                "${posts.id}. ${posts.title}",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            LikeButton(
              size: 30,
              countPostion: CountPostion.right,
              likeBuilder: (isLiked) => Icon(
                Icons.favorite,
                color: posts.favorite! ? Colors.red : Colors.grey,
                size: 20,
              ),
              onTap: (isLiked) {
                ref.read(homeProvider).favoritePosts(posts.id!);
                return Future.value(true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
