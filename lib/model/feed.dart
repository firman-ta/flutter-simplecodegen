import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed.freezed.dart';
part 'feed.g.dart'; 

@freezed
class Feed with _$Feed {
  const factory Feed({
    required int id,
    required User user,
    required Content content,
  }) = _Feed;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}

@freezed
class Content with _$Content {
  const factory Content({
    required String image,
    required String likes,
    required String description,
    required bool isLike,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required String name,
    required String avatar,
    required String place,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
