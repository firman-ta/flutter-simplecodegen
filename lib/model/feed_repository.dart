import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:simplecodegen/model/feed.dart';

class FeedRepository {
  Future<List<Feed>> fetch() async {
    final String response = await rootBundle.loadString('assets/feed.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Feed.fromJson(json)).toList();
  }
}
