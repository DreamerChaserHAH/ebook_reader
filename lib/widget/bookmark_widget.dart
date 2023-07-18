import 'package:ebook_reader_1/main_screen.dart';
import 'package:ebook_reader_1/screen/view_book_screen.dart';
import 'package:flutter/material.dart';

import '../tab_bar.dart';

class BookMarkWidget extends StatelessWidget {
  int targetPage;

  BookMarkWidget({super.key, required this.targetPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: 341,
        height: 85,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SizedBox(
              width: 200,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Image.asset(
                      "assets/bookmark-icon-3d.png",
                      fit: BoxFit.cover,
                      width: 30,
                      height: 45,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 3),
                    child: Text(
                      "Page " + targetPage.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(66, 66, 66, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            trailing: Padding(
              padding: EdgeInsets.only(top: 10, right: 20),
              child: GestureDetector(
                onTap: () {
                  CurrentPageRecorder.currentPage = targetPage;

                  displayerContainerState.currentState
                      ?.setCurrentScreen(Screens.bookScreen);

                  homeButton.currentState?.changeBool(false);
                  bookButton.currentState?.changeBool(true);
                  bookmarkButton.currentState?.changeBool(false);
                },
                child: Container(
                  width: 77,
                  height: 27,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber),
                  child: const Center(
                    child: Text("Go To"),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
