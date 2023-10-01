import 'package:equatable/equatable.dart';

class Posts extends Equatable {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  final bool? favorite;

  const Posts({this.userId, this.id, this.title, this.body, this.favorite});

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      favorite: false);

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };

  Posts copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
    bool? favorite,
  }) {
    return Posts(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        favorite: favorite ?? this.favorite);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [userId, id, title, body, favorite];
}
