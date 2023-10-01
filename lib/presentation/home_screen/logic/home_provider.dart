import 'package:cimb_testcase/common/enum.dart';
import 'package:cimb_testcase/models/posts/posts.dart';
import 'package:cimb_testcase/models/states/home_state.dart';
import 'package:cimb_testcase/services/posts_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends ChangeNotifier {
  late HomeState homeState = HomeState(posts: [], state: RequestState.empty);

  List<Posts> get postsFavorite => homeState.posts.isEmpty
      ? []
      : homeState.posts.where((e) => e.favorite == true).toList();

  void fetchPosts() async {
    homeState = homeState.copyWith(state: RequestState.loading);
    homeState = await PostsServices().fetchData();
    notifyListeners();
  }

  void addPosts(Posts posts) {
    List<Posts> data = homeState.posts;
    homeState.posts.add(posts);
    homeState = homeState.copyWith(posts: data, state: RequestState.success);
    notifyListeners();
  }

  void favoritePosts(int id) {
    List<Posts> data = homeState.posts;
    int index = data.indexWhere((e) => e.id == id);
    data[index] =
        data[index].copyWith(favorite: data[index].favorite! ? false : true);
    notifyListeners();
  }
}

final homeProvider = ChangeNotifierProvider<HomeNotifier>((ref) {
  return HomeNotifier();
});
