import 'package:ebook_reader_1/constant/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingIcon extends StatelessWidget {
  const SettingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,top: 17),
      child: IconButton(onPressed: (){},
       icon: Icon(Icons.settings,size: 30,)),
    );
  }
}

class StaredWidget extends StatelessWidget {
  const StaredWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23,left:26),
      child: Row(
        children: [
          SvgPicture.asset(kStarIcon,color: Colors.white,
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
    );
  }
}