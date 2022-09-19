import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tech_blog/component/myComponent.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:tech_blog/controller/article_controller.dart';
import 'package:tech_blog/controller/article_single_controller.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/view/article_single_screen.dart';

class ArticleListScreen extends StatelessWidget {


  ArticleListScreen({Key? key}) : super(key: key);
  ArticleController articleController = Get.put(ArticleController());
  SingleArcticleController singleArcticleController = Get.put(SingleArcticleController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppbar("مقالات جدید"),
        body:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Obx(()=>
                 ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: articleController.articleList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                      singleArcticleController.getArticleInfo(articleController.articleList[index].id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width / 3,
                              height: Get.height / 7,
                              child: CachedNetworkImage(
                                imageUrl:
                                    articleController.articleList[index].image!,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      image: DecorationImage(
                                          image: imageProvider, fit: BoxFit.cover),
                                    ),
                                  );
                                },
                                placeholder: (context, url) {
                                  return Loading();
                                },
                                errorWidget: (context, url, error) {
                                  return Icon(
                                    Icons.image_aspect_ratio_outlined,
                                    size: 50,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Get.width / 2,
                                    child: Text(
                                        articleController.articleList[index].title!,
                                        style: TextStyle(
                                          fontSize: 14,

                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2),
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        articleController.articleList[index].author!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                          articleController.articleList[index].view!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
    );
  }
}
