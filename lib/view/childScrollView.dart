import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_string.dart';
import 'package:get/get.dart';

SingleChildScrollView buildSingleChildScrollView(Size size, double bodyMargin) {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Obx(()=>
       Padding(
        padding: EdgeInsets.only(top: 16),

        child:homeScreenController.loading.value == false? Column(
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
              padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
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
            SizedBox(
              height: 30,
            ),
          ],
        ):const SpinKitThreeBounce(
          color: SolidColors.primeryColor,
          size: 40.0,
        ) ,
      ),
    ),
  );
}

SizedBox listview_one(Size size, double bodyMargin) {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  return SizedBox(
    height: size.height / 3.5,
    child: Obx(
      () => ListView.builder(
          itemCount: homeScreenController.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      height: size.height / 5.3,
                      width: size.width / 2.5,
                      //برای وقتی که عکس لود نشد این پکیج استفاده داره و همچنین لود یک آیکون قبل لود عکس
                      child: CachedNetworkImage(
                          imageUrl: homeScreenController.topVisitedList[index].image!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image:imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => const SpinKitFadingCube(
                          color: SolidColors.primeryColor,
                          size: 32.0,
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.image_not_supported_outlined,
                        color: Colors.grey,
                        size: 50.0,),
                      ),
                      foregroundDecoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            homeScreenController.topVisitedList[index].author!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: SolidColors.posterSubTitle,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                homeScreenController
                                    .topVisitedList[index].view!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: SolidColors.posterSubTitle,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              const Icon(
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
                      homeScreenController.topVisitedList[index].title!,
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            );
          })),
    ),
  );
}



SizedBox listview_tow(Size size, double bodyMargin) {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  return SizedBox(
    height: size.height / 3.5,
    child: Obx(
      () => ListView.builder(
          itemCount: homeScreenController.topPodcastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      height: size.height / 5.3,
                      width: size.width / 2.5,
                      child:
                      CachedNetworkImage(
                        imageUrl: homeScreenController.topPodcastList[index].poster!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image:imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => const SpinKitFadingCube(
                          color: SolidColors.primeryColor,
                          size: 32.0,
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.image_not_supported_outlined,
                          color: Colors.grey,
                          size: 50.0,),
                      ),
                      foregroundDecoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),

                      ),
                    ),

                  ]),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: size.width / 2.4,
                    child: Text(
                      homeScreenController.topPodcastList[index].title!,
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            );
          })),
    ),
  );
}



Stack poster(Size size) {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  return Stack(
    children: [
      Container(
        width: size.width / 1.10,
        height: size.height / 4.1,
        child:CachedNetworkImage(
          imageUrl: homeScreenController.poster.value.image!,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                image:imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => const SpinKitFadingCube(
            color: SolidColors.primeryColor,
            size: 32.0,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.image_not_supported_outlined,
            color: Colors.grey,
            size: 50.0,),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
