import 'package:ebook_reader_1/screen/bookmark_screen.dart';
import 'package:ebook_reader_1/screen/home_screen.dart';
import 'package:ebook_reader_1/screen/view_book_screen.dart';
import 'package:ebook_reader_1/tab_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

GlobalKey<MainScreenState> mainscreenState = GlobalKey<MainScreenState>();
GlobalKey<DisplayerContainerState> displayerContainerState =
    GlobalKey<DisplayerContainerState>();

enum Screens {
  homeScreen,
  bookScreen,
  bookmarkScreen,
}

class MainColors {
  static Color backgroundYellow = const Color.fromRGBO(241, 185, 22, 1);
  static Color backgroundGrey = const Color.fromARGB(255, 230, 230, 230);
}

class MainScreen extends StatefulWidget {
  final Key? key;

  late PreferredSizeWidget currentAppbar;

  MainScreen({this.key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  void updateAppBar(Screens for_) {
    print("App bar being changed");

    setState(() {
      if (for_ == Screens.homeScreen) {
        widget.currentAppbar = HomeScreenAppBar.getWidget();
      } else if (for_ == Screens.bookScreen) {
      } else {
        widget.currentAppbar = BookMarkScreenAppBar.getWidget();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    updateAppBar(Screens.homeScreen);

    return Scaffold(
        backgroundColor: MainColors.backgroundYellow,
        appBar: widget.currentAppbar,
        body: Stack(children: [
          Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: FractionallySizedBox(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: DisplayerContainer(
                      key: displayerContainerState,
                      currentScreen: Screens.homeScreen))),
          FloatingTabBar(
              isHomeSelected: true,
              isBookSelected: false,
              isBookmarkSelected: false)
        ]));
  }
}

class DisplayerContainer extends StatefulWidget {
  final Key? key;
  Screens currentScreen;

  DisplayerContainer({this.key, required this.currentScreen}) : super(key: key);

  @override
  State<DisplayerContainer> createState() => DisplayerContainerState();
}

class DisplayerContainerState extends State<DisplayerContainer> {
  void setCurrentScreen(Screens new_) {
    print("trying to change screen");

    setState(() {
      widget.currentScreen = new_;
    });
  }

  Widget displayScreen() {
    if (widget.currentScreen == Screens.homeScreen) {
      mainscreenState.currentState?.updateAppBar(Screens.homeScreen);
      return const HomeScreen();
    } else if (widget.currentScreen == Screens.bookScreen) {
      mainscreenState.currentState?.updateAppBar(Screens.bookScreen);
      return const ViewBookScreen();
    } else {
      mainscreenState.currentState?.updateAppBar(Screens.bookmarkScreen);
      return const BookMarkScreen();
    }
  }

  @override
  Widget build(BuildContext buildContext) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          color: Color.fromARGB(255, 230, 230, 230),
        ),
        child: Container(child: displayScreen()));
  }
}
