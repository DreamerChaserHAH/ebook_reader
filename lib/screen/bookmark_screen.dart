
import 'package:ebook_reader_1/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/bookmark_widget.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Padding(
          padding: const EdgeInsets.only(top: 23,left:26),
          child: Row(
            children: [
              SvgPicture.asset("assets/star.svg",color: Colors.white,
              fit: BoxFit.cover,
              width: 30,
              height: 35,),
              const Padding(
                padding: EdgeInsets.only(left: 8,top: 3),
                child: Text("Stared",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),))
            ],
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20,top: 17),
            child: IconButton(onPressed: (){},
             icon: Icon(Icons.settings,size: 30,)),
          )
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