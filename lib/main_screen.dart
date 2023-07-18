import 'package:ebook_reader_1/data_manager.dart';
import 'package:ebook_reader_1/screen/bookmark_screen.dart';
import 'package:ebook_reader_1/screen/home_screen.dart';
import 'package:ebook_reader_1/screen/view_book_screen.dart';
import 'package:ebook_reader_1/tab_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

GlobalKey<MainScreenState> mainscreenState = GlobalKey<MainScreenState>();
GlobalKey<DisplayerContainerState> displayerContainerState =
    GlobalKey<DisplayerContainerState>();
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

enum Screens {
  homeScreen,
  bookScreen,
  bookmarkScreen,
}

class TableOfContentsWidget extends StatefulWidget {
  bool isInSubtitleMode = false;
  int targetTitle = 0;

  final Key? key;

  TableOfContentsWidget({this.key}) : super(key: key);

  @override
  State<TableOfContentsWidget> createState() => TableOfContentsWidgetState();
}

class TableOfContentsWidgetState extends State<TableOfContentsWidget> {
  void showSubtitles(int title_id) {
    setState(() {
      widget.isInSubtitleMode = true;
      widget.targetTitle = title_id;
    });
  }

  void closeSubtitles() {
    setState(() {
      widget.isInSubtitleMode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: Color.fromRGBO(81, 81, 81, 1),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: SvgPicture.asset(
                          "assets/contents-icon.svg",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Contents",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: IconButton(
                        onPressed: () {
                          //_closeDrawer();
                          if (widget.isInSubtitleMode) {
                            closeSubtitles();
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                          color: Colors.white,
                        )),
                  ))
                ],
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Divider(
                  color: Colors.white,
                ),
              )
            ]),
          ),
          Expanded(
              child: Container(
            color: Color.fromRGBO(81, 81, 81, 1),
            child: ListView.builder(
              itemCount: (widget.isInSubtitleMode)
                  ? TableOfContentsData
                      .tacList[widget.targetTitle].chapters.length
                  : TableOfContentsData.tacList.length,
              itemBuilder: (context, index) {
                if (widget.isInSubtitleMode) {
                  return ListTile(
                      leading: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          globalpdfController.animateToPage(
                              pageNumber: TableOfContentsData
                                  .tacList[widget.targetTitle]
                                  .chapters[index]
                                  .pageNumber);
                          closeSubtitles();
                          Navigator.pop(context);
                        },
                        child: Text(
                          TableOfContentsData.tacList[widget.targetTitle]
                              .chapters[index].title,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ));
                } else {
                  return ListTile(
                      leading: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                      title: GestureDetector(
                        onTap: () {
                          showSubtitles(index);
                        },
                        child: Text(
                          TableOfContentsData.tacList[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                      ));
                }
              },
            ),
          ))
        ],
      )),
    );
  }
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
  void initState() {
    TableOfContentsData.loadTableOfContents();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    updateAppBar(Screens.homeScreen);

    return Scaffold(
        key: scaffoldKey,
        backgroundColor: MainColors.backgroundYellow,
        appBar: widget.currentAppbar,
        drawer: TableOfContentsWidget(),
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
      return ViewBookScreen();
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
