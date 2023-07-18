import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class bookmarkData {
  static List<int> bookmarkLists = List.empty(growable: true);

  static void addPage(int pageNumber) {
    if (!bookmarkLists.contains(pageNumber)) {
      bookmarkLists.add(pageNumber);
    }
  }

  static void loadFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? stored_string = prefs.getString("bookmarkList");
    if (stored_string?.isEmpty ?? true) {
      //Do nothing
    } else {
      List<int> decodedData = json.decode(stored_string!);
      bookmarkLists = decodedData;
    }
  }

  static void saveToLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("bookmarkList", json.encode(bookmarkLists));
  }
}

class TableOfContentsData {
  static List<TitleAndContent> tacList = List.empty();

  static void loadTableOfContents() async {
    String jsonString = await rootBundle.loadString('assets/burmese.json');

    print(jsonString);
    List<dynamic> data = jsonDecode(jsonString);
    tacList = data
        .map<TitleAndContent>((element) => TitleAndContent.fromJson(element))
        .toList();
  }
}

class TitleAndContent {
  final String title;
  final List<Chapter> chapters;

  TitleAndContent({
    required this.title,
    required this.chapters,
  });

  factory TitleAndContent.fromJson(Map<String, dynamic> json) {
    final List<dynamic> jsonPages = json['values'];
    final List<Chapter> chapters =
        jsonPages.map<Chapter>((json) => Chapter.fromJson(json)).toList();

    return TitleAndContent(
      title: json['name'],
      chapters: chapters,
    );
  }
}

class Chapter {
  final String title;
  final int pageNumber;

  Chapter({
    required this.title,
    required this.pageNumber,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      title: json['title'],
      pageNumber: json['page_no'],
    );
  }
}
