import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/myComponent.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 17;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              "assets/img/profile.png",
            ),
            height: 100,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                  color: SolidColors.colorTitle,
                  AssetImage("assets/img/hot.png")),
              SizedBox(
                width: 8,
              ),
              Text(
                MyStrings.imageProfileEdit,
                style: TextStyle(
                  color: SolidColors.colorTitle,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "روح اله ابراهیم زاده",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "rohi1386@yahoo.com",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 40,),

          My_Divider(size: size),
          InkWell(
            onTap: () {},
            splashColor: SolidColors.primeryColor,
            child: SizedBox(
              height: 45,
              child: Center(child: Text(MyStrings.myFavBlog,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500,),)),
            ),
          ),

          My_Divider(size: size),
          InkWell(
            onTap: () {},
            splashColor: SolidColors.primeryColor,
            child: SizedBox(
              height: 45,
              child: Center(child: Text(MyStrings.myFavPodcast,style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500,),)),
            ),
          ),

          My_Divider(size: size),
          InkWell(
            onTap: () {},
            splashColor: SolidColors.primeryColor,
            child: SizedBox(
              height: 45,
              child: Center(child: Text(MyStrings.logOut,style: TextStyle(color: Colors.red,fontWeight: FontWeight.w700,),)),
            ),
          ),
          const SizedBox(height: 60,),
        ],
      ),
    );
  }
}
