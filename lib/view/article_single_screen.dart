import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tech_blog/component/myComponent.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:tech_blog/controller/article_controller.dart';
import 'package:tech_blog/controller/article_single_controller.dart';
import 'package:tech_blog/models/article_model.dart';


class ArticleSingleScreen extends StatelessWidget {
  ArticleController articleController = Get.put(ArticleController());

  SingleArcticleController singleArcticleController = Get.put(SingleArcticleController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(()=>singleArcticleController.articleInfoModel.value.title == null ?
          SizedBox(
            height: Get.height,
              child: Loading())

              : Column(
              children: [
                Stack(
                  children: [

                    CachedNetworkImage(
                      imageUrl: singleArcticleController
                          .articleInfoModel.value.image!,
                      imageBuilder: ((context, imageProvider) =>
                          Image(image: imageProvider)),
                      placeholder: ((context, url) => const Loading()),
                      errorWidget: ((context, url, error) =>
                          Icon(
                            Icons.image_aspect_ratio_outlined,
                            size: 50,
                            color: Colors.grey,
                          )
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: GradiantColors.singleAppbarGradiant,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Icon(
                                CupertinoIcons.arrow_right,
                                color: Colors.white,
                                size: 24,
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Icon(
                                CupertinoIcons.bookmark,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                CupertinoIcons.share,
                                color: Colors.white,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    singleArcticleController.articleInfoModel.value.title!,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Row(
                    children: [
                      Text(singleArcticleController.articleInfoModel.value.author!),
                      SizedBox(
                        width: 16,
                      ),
                      Text(singleArcticleController.articleInfoModel.value.createdAt!),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HtmlWidget(singleArcticleController.articleInfoModel.value.content!, textStyle: TextStyle(
                    height: 1.7,
                    fontSize: 16,
                  )),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
