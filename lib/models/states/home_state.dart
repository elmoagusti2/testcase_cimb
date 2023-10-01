import 'package:cimb_testcase/models/posts/posts.dart';

import '../../common/enum.dart';

class HomeState {
  List<Posts> posts;
  RequestState? state;

  HomeState({
    required this.posts,
    this.state,
  });

  HomeState copyWith({List<Posts>? posts, RequestState? state}) {
    return HomeState(posts: posts ?? this.posts, state: state ?? this.state);
  }
}
