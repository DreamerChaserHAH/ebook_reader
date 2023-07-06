import 'package:ebook_reader_1/screen/bookmark_screen.dart';
import 'package:ebook_reader_1/screen/home_screen.dart';
import 'package:ebook_reader_1/screen/view_book_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomeScreen(),
      home:ViewBookScreen(),
    );
  }
}

