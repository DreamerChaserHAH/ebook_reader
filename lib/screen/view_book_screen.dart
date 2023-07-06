

import 'package:ebook_reader_1/constant/color.dart';
import 'package:ebook_reader_1/item_view/content_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewBookScreen extends StatefulWidget {
  const ViewBookScreen({super.key});

  @override
  State<ViewBookScreen> createState() => _ViewBookScreenState();
}

class _ViewBookScreenState extends State<ViewBookScreen> {
  bool _isSearhBar  = false;
  TextEditingController _searchController =TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.pop(context);
  }

  void _toggleSearchBar(){
    setState(() {
      _isSearhBar =!_isSearhBar;
      if(_isSearhBar){
        _searchController.clear();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
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
    drawer:SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Drawer(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    color: Color.fromRGBO(81, 81, 81, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20,top: 10),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: SvgPicture.asset(
                                "assets/contents-icon.svg",
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,left: 10),
                            child: Text(
                              "Contents",
                              style: TextStyle(
                                color: Colors.white,
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 200,top: 10),
                            child: IconButton(
                                onPressed: () {
                                  _closeDrawer();
                                },
                                icon:const  Icon(
                                  Icons.close,
                                  size: 30,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                      const Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Divider(color: Colors.white,),
                      )
                      ]
                    ),
                  ),
                  Expanded(
                    child: Container(
                         color: Color.fromRGBO(81, 81, 81, 1),
                      child: ListView.builder( 
                        itemCount:30 ,
                         itemBuilder:(context, index) {
                           return ListTile(
                            leading: Icon(Icons.chevron_right,color: Colors.white,),
                            title: Text("Content $index",style: TextStyle(
                              color: Colors.white
                            ),),
                           );
                         },
                         
                         
                         ),
                    ))

                ],
              )
            ),
          ),
      ),
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
                       GestureDetector(
                        onTap: (){ print("star");},
                         child: Padding(
                           padding: const EdgeInsets.only(left: 180,top: 20),
                           child: Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber
                              
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/star.svg",
                                color: Colors.white,),
                                Text("stared",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),)
                         
                              ],
                            ),
                           ),
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
          border: InputBorder.none
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  
  MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,top: 10),
      child: GestureDetector(
        onTap: (){
         
        },
        child: SizedBox(
          width: 30,
          height: 30,
          child: SvgPicture.asset("assets/contents-icon.svg",
                   color: Colors.white,),
        ),
      )
    );
  }
}

class ContentsWidget extends StatelessWidget {
  const ContentsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(top: 10),
      child: Text("Contents",style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700
      ),),
    );
  }
}

