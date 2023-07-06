import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewBookScreen extends StatelessWidget {
  const ViewBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text("Contents",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700
          ),),
        ),
        backgroundColor:  const Color.fromRGBO(241, 185, 22, 1),
        leading: Padding(
          padding: const EdgeInsets.only(left: 25,top: 10),
          child: GestureDetector(
            onTap: (){
              print("object");
            },
            child: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset("assets/contents-icon.svg",
                       color: Colors.white,),
            ),
          )
        ),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10,top: 10),
          child: IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 28,)
          ),
        )
      ],
    ),
    body: Stack(
      children: [
        Container(
          width: double.infinity,
           height: 733,
            color:const  Color.fromRGBO(241, 185, 22, 1),
        ),
        Positioned(
          top: 30,
          child: Container(
            width: 400,
            height: 733,
            decoration: const BoxDecoration(
                color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                  ),

            child: Column(
              children: [
                Row(
                  children: [
                     Padding(
                          padding: const EdgeInsets.only(top: 19,left:26),
                          child: SvgPicture.asset("assets/page-flip.svg",
                            color: Color.fromRGBO(66, 66, 66, 1),
                            width: 25,
                            height: 24,
                          ),
                        ),
                        const Padding(
                         padding:  EdgeInsets.only(top: 19,left: 8),
                         child:  Text(
                           "Page-1",style:
                           TextStyle(
                              color: Color.fromRGBO(66, 66, 66, 1),
                             fontSize: 16,
                             fontWeight: FontWeight.w700,
                           ),
                         ),
                       ),
                       Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)
                          
                        ),
                       )
                  ],
                )
              ],
            ),
            ),
        ),
  ],
    ),
    )
    ;
  }
}