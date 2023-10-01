import 'dart:convert';

import 'package:cimb_testcase/common/enum.dart';
import 'package:http/http.dart' as http;

import '../models/posts/posts.dart';
import '../models/states/home_state.dart';

class PostsServices {
  Future<HomeState> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        List<Posts> data = (jsonDecode(response.body) as List)
            .map((e) => Posts.fromJson(e))
            .toList();
        return HomeState(
            posts: data.sublist(0, 5), state: RequestState.success);
      }
    } catch (e) {
      return HomeState(posts: [], state: RequestState.error);
    }
    return HomeState(posts: [], state: RequestState.empty);
  }
}
