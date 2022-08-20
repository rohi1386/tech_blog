import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tech_blog/my_colors.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          // AppBar ///////////////////////////////
          padding: EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.menu),
                  Image.asset(
                    "assets/img/logo.png",
                    height: size.height / 13.6,
                  ),
                  const Icon(CupertinoIcons.search),
                ],
              ),

              // Slider ///////////////////////////////
              Stack(
                children: [
                  Container(
                    width: size.width / 1.10 ,
                    height: size.height / 4.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: new DecorationImage(
                          image: new AssetImage('assets/img/programming.png'),
                          fit: BoxFit.cover),
                    ),
                    foregroundDecoration: const BoxDecoration(

                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        colors: GradiantColors.homePosterCoverGradiant,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child:
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("روح اله عزیر - یک روز پیش",
                                style: TextStyle(
                                  color: SolidColors.posterSubTitle,
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                children: [
                                  Text("253",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: SolidColors.posterSubTitle,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(CupertinoIcons.eye_solid,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Text("دوازده قدم برنامه نویسی یک دوره ی...",
                          style: TextStyle(
                            color: SolidColors.posterTitle,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
