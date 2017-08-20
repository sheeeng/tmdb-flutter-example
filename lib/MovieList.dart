import 'dart:convert';
import 'dart:collection';

// https://github.com/flutter/flutter/issues/9318

class MovieList {
  final List<dynamic> results;
  final int page;
  final int total_results;
  final LinkedHashMap<String, dynamic> dates;
  final int total_pages;

  MovieList.fromMap(Map<String, dynamic> map)
      :
        results = map["results"],
        page = map["page"],
        total_results = map["total_results"],
        dates = map["dates"],
        total_pages = map["total_pages"];

  Map <String, dynamic> toMap() {
    return {
      "results": results,
      "page": page,
      "total_results": total_results,
      "dates": dates,
      "total_pages": total_pages,
    };
  }
}