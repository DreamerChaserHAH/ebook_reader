import 'package:ebook_reader_1/main_screen.dart';
import 'package:ebook_reader_1/screen/bookmark_screen.dart';
import 'package:ebook_reader_1/screen/view_book_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenAppBar {
  static PreferredSizeWidget getWidget() {
    return AppBar(
      automaticallyImplyLeading: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
      backgroundColor: MainColors.backgroundYellow,
      title: const Padding(
        padding: EdgeInsets.only(left: 26, top: 20),
        child: Text(
          "Sahih Muslim Hadith",
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screenList = [
    HomeScreen(),
    ViewBookScreen(),
    BookMarkScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 19, left: 26),
              child: SvgPicture.asset(
                "assets/book.svg",
                color: Color.fromRGBO(66, 66, 66, 1),
                width: 25,
                height: 24,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 19, left: 8),
              child: Text(
                "Book",
                style: TextStyle(
                  color: Color.fromRGBO(66, 66, 66, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
        Flexible(
          flex: 7,
          fit: FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/bookcover.png",
                fit: BoxFit.cover,
                width: 140 * 2,
                height: 225 * 2,
              ),
            ),
          ),
        ),
        const Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Funded By: Ahlay Hadith Myanmar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Center(
                    child: Text(
                  "Copyrighted By Mohammed Ridwan Al Hafiz @ Wai Yan Hein",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(66, 66, 66, 1),
                  ),
                ))
              ],
            )),
      ],
    );
  }
}
