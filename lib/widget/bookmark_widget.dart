import 'package:flutter/material.dart';

class BookMarkWidget extends StatelessWidget {
  const BookMarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 341,
                      height: 85,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: SizedBox(
                            width: 200,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 20),
                                  child: Image.asset("assets/bookmark-icon-3d.png",fit: BoxFit.cover,
                                    width: 30,
                                    height: 45,),
                                ),
                                const Padding(
                              padding: const EdgeInsets.only(top: 10,left: 3),
                              child: Text("Page_1",style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Color.fromRGBO(66, 66, 66, 1),
                                ),),
                            ),
                              ],
                            ),
                          ),
                          trailing: Padding(
                            padding: EdgeInsets.only(top: 10,right: 20),
                            child: GestureDetector(
                              onTap: (){},
                              child: Container(
                                  width: 77,
                                  height: 27,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber
                                  ),
                                  child: const Center(
                                    child: Text("Go To"),
                                  ),
                                ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                
  }
}