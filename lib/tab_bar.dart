import 'package:ebook_reader_1/main_screen.dart';
import 'package:ebook_reader_1/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

GlobalKey<_AnimatedButtonState> homeButton = GlobalKey<_AnimatedButtonState>();
GlobalKey<_AnimatedButtonState> bookButton = GlobalKey<_AnimatedButtonState>();
GlobalKey<_AnimatedButtonState> bookmarkButton =
    GlobalKey<_AnimatedButtonState>();

class AnimatedButton extends StatefulWidget {
  final Key? key;
  final String unselectedImagePath;
  final String selectedImagePath;
  final Screens targetScreen;
  final Function onclicked;

  bool isSelected;

  AnimatedButton(
      {this.key,
      required this.unselectedImagePath,
      required this.selectedImagePath,
      required this.isSelected,
      required this.targetScreen,
      required this.onclicked})
      : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  void changeBool(bool newValue) {
    //print("Trying to change!");
    setState(() {
      widget.isSelected = newValue;
    });
  }

  void onButtonClicked() {
    widget.onclicked();
    //print("Trying to click");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onButtonClicked,
        child: Center(
            child: SvgPicture.asset(widget.isSelected
                ? widget.selectedImagePath
                : widget.unselectedImagePath)));
  }
}

class FloatingTabBar extends StatelessWidget {
  final bool isHomeSelected;
  final bool isBookSelected;
  final bool isBookmarkSelected;

  void onHomeButtonClicked() {
    displayerContainerState.currentState?.setCurrentScreen(Screens.homeScreen);

    homeButton.currentState?.changeBool(true);
    bookButton.currentState?.changeBool(false);
    bookmarkButton.currentState?.changeBool(false);
  }

  void onBookButtonClicked() {
    displayerContainerState.currentState?.setCurrentScreen(Screens.bookScreen);

    homeButton.currentState?.changeBool(false);
    bookButton.currentState?.changeBool(true);
    bookmarkButton.currentState?.changeBool(false);
  }

  void onBookmarkButtonClicked() {
    displayerContainerState.currentState
        ?.setCurrentScreen(Screens.bookmarkScreen);

    homeButton.currentState?.changeBool(false);
    bookButton.currentState?.changeBool(false);
    bookmarkButton.currentState?.changeBool(true);
  }

  FloatingTabBar(
      {Key? key,
      required this.isHomeSelected,
      required this.isBookSelected,
      required this.isBookmarkSelected});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: 50,
      child: Align(
        alignment: Alignment.bottomCenter,
        widthFactor: 2,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                      bottomLeft: Radius.circular(45.0),
                      bottomRight: Radius.circular(45.0)),
                  color: Color.fromARGB(255, 75, 75, 75)),
              height: 50, // Example background color
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                        alignment: Alignment.center,
                        child: FractionallySizedBox(
                            heightFactor: 0.8,
                            child: AnimatedButton(
                              key: homeButton,
                              unselectedImagePath: "assets/home_unselected.svg",
                              selectedImagePath: "assets/home_selected.svg",
                              isSelected: isHomeSelected,
                              targetScreen: Screens.homeScreen,
                              onclicked: onHomeButtonClicked,
                            ))),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.center,
                        child: FractionallySizedBox(
                            heightFactor: 0.8,
                            child: AnimatedButton(
                              key: bookButton,
                              unselectedImagePath: "assets/book_unselected.svg",
                              selectedImagePath: "assets/book_selected.svg",
                              isSelected: isBookSelected,
                              targetScreen: Screens.bookScreen,
                              onclicked: onBookButtonClicked,
                            ))),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.center,
                        child: FractionallySizedBox(
                            heightFactor: 0.8,
                            child: AnimatedButton(
                              key: bookmarkButton,
                              unselectedImagePath: "assets/star_unselected.svg",
                              selectedImagePath: "assets/star_selected.svg",
                              isSelected: isBookmarkSelected,
                              targetScreen: Screens.bookmarkScreen,
                              onclicked: onBookmarkButtonClicked,
                            ))),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
