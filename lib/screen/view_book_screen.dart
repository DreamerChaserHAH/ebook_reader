import 'package:ebook_reader_1/constant/color.dart';
import 'package:ebook_reader_1/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdfx/pdfx.dart';
import '../data_manager.dart';

late PdfControllerPinch globalpdfController;

/*
class ViewBookScreenAppbar{
  static PreferredSizeWidget getWidget(){
    return AppBar(
        title: !_isSearhBar ? ContentsWidget():Container(
      width: 300,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50)
      ),
      child: SearchBoxText(searchController: _searchController),
    ),
        backgroundColor:  kPrimaryColor,
        leading: !_isSearhBar ? Padding(
      padding: const EdgeInsets.only(left: 25,top: 10),
      child: GestureDetector(
        onTap: (){
         _openDrawer();
        },
        child: SizedBox(
          width: 30,
          height: 30,
          child: SvgPicture.asset("assets/contents-icon.svg",
                   color: Colors.white,),
        ),
      )
    ) : 
        IconButton(onPressed: _toggleSearchBar, icon: Icon(Icons.arrow_back)), 
      elevation: 0,
      actions: [
        if(!_isSearhBar)
        Padding(
          padding: const EdgeInsets.only(right: 10,top: 10),
          child: IconButton(onPressed: _toggleSearchBar, icon: Icon(Icons.search,size: 28,)
          ),
        ),
      
      ],
    ),
  }
}*/

class CurrentPageRecorder {
  static int currentPage = 1;
}

class ViewBookScreen extends StatefulWidget {
  late int currentPage;

  ViewBookScreen({super.key});

  @override
  State<ViewBookScreen> createState() => _ViewBookScreenState();
}

class _ViewBookScreenState extends State<ViewBookScreen> {
  bool _isSearhBar = false;
  TextEditingController _searchController = TextEditingController();

  late PdfControllerPinch _pdfController;
  final PageController _pageController = PageController();

  @override
  initState() {
    widget.currentPage = CurrentPageRecorder.currentPage;

    _pdfController = PdfControllerPinch(
        document: PdfDocument.openAsset("assets/burmese_version.pdf"),
        initialPage: widget.currentPage);

    globalpdfController = _pdfController;

    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.pop(context);
  }

  void _toggleSearchBar() {
    setState(() {
      _isSearhBar = !_isSearhBar;
      if (_isSearhBar) {
        _searchController.clear();
      }
    });
  }

  void _changePage(int newPage) {
    setState(() {
      widget.currentPage = newPage;
      CurrentPageRecorder.currentPage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      //Go To Page
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 20, bottom: 20),
                          child: SvgPicture.asset(
                            "assets/page-flip.svg",
                            color: Color.fromRGBO(66, 66, 66, 1),
                            width: 25,
                            height: 24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 20, bottom: 20),
                          child: Text(
                            "Page " + widget.currentPage.toString(),
                            style: TextStyle(
                              color: Color.fromRGBO(66, 66, 66, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ))),
            Expanded(
                child: GestureDetector(
              onTap: () {
                _openDrawer();
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 20, bottom: 20),
                    child: SvgPicture.asset(
                      "assets/contents-icon.svg",
                      width: 25,
                      height: 24,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Contents",
                      style: TextStyle(
                        color: Color.fromRGBO(66, 66, 66, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            )),
            GestureDetector(
              onTap: () {
                bookmarkData.addPage(widget.currentPage);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 20, bottom: 20),
                child: Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/star.svg",
                        color: Colors.white,
                      ),
                      const Text(
                        "stared",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: PdfViewPinch(
            onPageChanged: (page) => _changePage(page),
            controller: _pdfController,
            builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
              options: const DefaultBuilderOptions(),
              documentLoaderBuilder: (_) => Center(
                child: CircularProgressIndicator(
                  color: Colors.grey[800],
                ),
              ),
              pageLoaderBuilder: (_) => Center(
                child: CircularProgressIndicator(
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SearchBoxText extends StatelessWidget {
  const SearchBoxText({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: TextField(
        controller: _searchController,
        autofocus: true,
        decoration: const InputDecoration(
            hintText: "Search Page",
            hintStyle: TextStyle(color: Colors.red),
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            border: InputBorder.none),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25, top: 10),
        child: GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              "assets/contents-icon.svg",
              color: Colors.white,
            ),
          ),
        ));
  }
}

class ContentsWidget extends StatelessWidget {
  const ContentsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "Contents",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}
