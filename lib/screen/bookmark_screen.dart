
import 'package:ebook_reader_1/constant/color.dart';
import 'package:ebook_reader_1/constant/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../item_view/bookmark_item_view.dart';
import '../widget/bookmark_widget.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: StaredWidget(),
        elevation: 0,
        actions:const  [
          SettingIcon()
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 800,
            color:kPrimaryColor,
          ),
          Positioned(
            top: 30,
            child: Container(
              width: 400,
              height: 800,
              decoration:const  BoxDecoration(
                borderRadius: BorderRadius.only( topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                color: Color.fromRGBO(245, 245, 245, 1)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemBuilder:(context, index)
                 {
                  return BookMarkWidget();
                },
                itemCount: 15,),
              ),
            ),
          )

        ],
      ),
    );
  }
}

