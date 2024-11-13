import 'package:flutter/material.dart';
import 'package:simplecodegen/model/feed.dart';
import 'package:simplecodegen/model/feed_repository.dart';

class FeedController extends ChangeNotifier {
  bool _isFetching = false;
  List<Feed> _feedList = [];

  // Use getters and setters for feed list and fetching state
  List<Feed> get feedList => _feedList;
  bool get isFetching => _isFetching;

  int get length => _feedList.length;

  Future<void> fetch() async {
    _setFetching(true);

    try {
      final repository = FeedRepository();
      _feedList = (await repository.fetch())..shuffle();
    } catch (e) {
      print("Error fetching feeds: $e");
    } finally {
      _setFetching(false);
    }
  }

  void like(Feed feed) {
    // Update the liked feed using copyWith to make it immutable
    final updatedFeedList = _feedList.map((e) {
      return e.id == feed.id
          ? e.copyWith(
              content: e.content.copyWith(
                isLike: !e.content.isLike,
              ),
            )
          : e;
    }).toList();

    _feedList = updatedFeedList; 
    notifyListeners(); 
  }

  void _setFetching(bool isFetching) {
    _isFetching = isFetching;
    notifyListeners(); 
  }
}
