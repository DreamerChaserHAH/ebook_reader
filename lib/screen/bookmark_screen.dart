import 'package:ebook_reader_1/constant/color.dart';
import 'package:ebook_reader_1/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../item_view/bookmark_item_view.dart';
import '../widget/bookmark_widget.dart';

class BookMarkScreenAppBar {
  static PreferredSizeWidget getWidget() {
    return AppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
      backgroundColor: MainColors.backgroundYellow,
      title: const Padding(
        padding: EdgeInsets.only(left: 26, top: 20),
        child: Text(
          "Starred",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 20),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                size: 30,
                color: Colors.white,
              )),
        ),
      ],
    );
  }
}

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      child: Container(
        width: 400,
        height: 800,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: Color.fromRGBO(245, 245, 245, 1)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return BookMarkWidget();
            },
            itemCount: 15,
          ),
        ),
      ),
    );
  }
}
