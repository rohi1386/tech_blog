
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_string.dart';


SingleChildScrollView buildSingleChildScrollView(Size size, double bodyMargin) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Padding(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        children: [

          poster(size),


          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 20, 10),
            child: Row(
              children: const [
                ImageIcon(
                    color: SolidColors.colorTitle,
                    AssetImage("assets/img/hot.png")),
                SizedBox(
                  width: 8,
                ),
                Text(
                  MyStrings.viewHotestBlog,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: SolidColors.colorTitle,
                  ),
                ),
              ],
            ),
          ),

          listview_one(size, bodyMargin),

          // title in hot article
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 20, 10),
            child: Row(
              children: const [
                ImageIcon(
                    color: SolidColors.colorTitle,
                    AssetImage("assets/img/pad.png")),
                SizedBox(
                  width: 8,
                ),
                Text(
                  MyStrings.viewHotestPodCasts,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: SolidColors.colorTitle,
                  ),
                ),
              ],
            ),
          ),

          listview_tow(size, bodyMargin),
          SizedBox(height: 30,),
        ],
      ),
    ),
  );
}



SizedBox listview_tow(Size size, double bodyMargin) {
  return SizedBox(
          height: size.height / 3.5,
          child: ListView.builder(
              itemCount: blogList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: index == 0 ? bodyMargin : 15),
                  child: Column(
                    children: [
                      Stack(children: [
                        Container(
                          height: size.height / 5.3,
                          width: size.width / 2.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(16)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  blogList[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(16)),

                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                blogList[index].writer,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: SolidColors.posterSubTitle,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    blogList[index].views,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: SolidColors
                                          .posterSubTitle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    CupertinoIcons.eye_solid,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: size.width / 2.4,
                        child: Text(
                          blogList[index].title,
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                );
              })),
        );
}



SizedBox listview_one(Size size, double bodyMargin) {
  return SizedBox(
          height: size.height / 3.5,
          child: ListView.builder(
              itemCount: blogList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: index == 0 ? bodyMargin : 15),
                  child: Column(
                    children: [
                      Stack(children: [
                        Container(
                          height: size.height / 5.3,
                          width: size.width / 2.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(16)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  blogList[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(16)),
                            gradient: LinearGradient(
                              colors: GradiantColors.blogPost,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                blogList[index].writer,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: SolidColors.posterSubTitle,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    blogList[index].views,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: SolidColors
                                          .posterSubTitle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    CupertinoIcons.eye_solid,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: size.width / 2.4,
                        child: Text(
                          blogList[index].title,
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                );
              })),
        );
}



Stack poster(Size size) {
  return Stack(
          children: [
            Container(
              width: size.width / 1.10,
              height: size.height / 4.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: new DecorationImage(
                    image: new AssetImage(
                        'assets/img/programming.png'),
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "روح اله عزیر - یک روز پیش",
                          style: TextStyle(
                            color: SolidColors.posterSubTitle,
                            fontSize: 12,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "253",
                              style: TextStyle(
                                fontSize: 12,
                                color: SolidColors.posterSubTitle,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              CupertinoIcons.eye_solid,
                              color: Colors.white,
                              size: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "دوازده قدم برنامه نویسی یک دوره ی...",
                    style: TextStyle(
                      color: SolidColors.posterTitle,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
}