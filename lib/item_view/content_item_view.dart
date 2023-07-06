import 'package:ebook_reader_1/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContentDrawer extends StatelessWidget {
  const ContentDrawer ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width *1,
        child: Drawer(
          child: Column(
            children: [
              Container(
                height: 150,
                color: kContentItemColor,
                child: Text(
                  "hello"
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}