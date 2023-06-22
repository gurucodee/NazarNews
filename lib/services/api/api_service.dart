import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:NazarNewsTV/models/app_data.dart';

enum PagesUrl {
  home,
  topics,
  post_topic,
  archive,
  archive_year,
  youtube,
  stream,
  popular_posts,
  search,
}

// Generic Future Function to handle different classes objects
Future<T> apiService<T>(
  PagesUrl endpoint,
  Type type, [
  int? pageSize,
  int? currentPage,
]) async {
  final String language = 'ru';
  const String backend = 'https://192.168.1.105:5000/api';
  final String fullUrl =
      '$backend/${_paths[endpoint]}?pageSize=${pageSize ?? 50}&currentPage=${currentPage ?? 1}&language=$language';

  final response = await http.get(
    Uri.parse(fullUrl),
    headers: {"Accept": "application/json"},
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // utf8.decode() is to decode any not latin language
    switch (type) {
      case NazarData:
        return NazarData.fromJson(jsonDecode(utf8.decode(response.bodyBytes)))
            as T;
      default:
        throw StateError('Unable to unmarshal value of type \'$type\'');
    }
    ;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load posts');
  }
}

const Map<PagesUrl, String> _paths = {
  PagesUrl.home: 'mobile/news',
  PagesUrl.topics: 'categories',
  PagesUrl.post_topic: 'news/category',
  PagesUrl.archive: 'archive',
  PagesUrl.archive_year: 'archive_by_year',
  PagesUrl.youtube: 'nazartv',
  PagesUrl.stream: 'live_stream',
  PagesUrl.popular_posts: 'news/popular',
  PagesUrl.search: 'posts/search',
};
