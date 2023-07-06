import 'package:ebook_reader_1/screen/bookmark_screen.dart';
import 'package:ebook_reader_1/screen/view_book_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex =0;
  final List<Widget> _screenList =[
    HomeScreen(),
    ViewBookScreen(),
    BookMarkScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(241, 185, 22, 1),
        title: Padding(
          padding: const EdgeInsets.only(left: 26 ,top: 20),
          child: const Text("App Name",style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding:const  EdgeInsets.only(top: 15,right: 20),
            child:
            IconButton(onPressed: (){},
                icon:const  Icon(Icons.settings,size: 30,color: Colors.white,)
            ),
          ),
        ],
      ),
      body:
       Stack(
          children: [
            Container(
              height: 733,
              color: Color.fromRGBO(241, 185, 22, 1),
            ),

            Positioned(
              top: 20,
              child: Container(
                height: 733,
                width: 400,
                decoration:const  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 19,left:26),
                          child: SvgPicture.asset("assets/book.svg",
                            color: Color.fromRGBO(66, 66, 66, 1),
                            width: 25,
                            height: 24,
                          ),
                        ),
                       const Padding(
                         padding:  EdgeInsets.only(top: 19,left: 8),
                         child:  Text(
                           "Book",style:
                           TextStyle(
                              color: Color.fromRGBO(66, 66, 66, 1),
                             fontSize: 16,
                             fontWeight: FontWeight.w700,
                           ),
                         ),
                       )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/ebook-cover-design-template.jpg",
                        fit: BoxFit.cover,
                        width: 140,
                        height: 225,),
                      ),
                    ),
                   const  Text("Title",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),),
                    const Text("Description",style: TextStyle(
                      fontSize: 15,
                      color:  Color.fromRGBO(66, 66, 66, 1),

                    ),)
                  ],
                ),
              ),
            ),
          
          ]),
    );
  }
}