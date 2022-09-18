import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tech_blog/component/myComponent.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:tech_blog/controller/article_controller.dart';
import 'package:tech_blog/models/article_model.dart';

class ArticleSingleScreen extends StatelessWidget {
  ArticleController articleController = Get.put(ArticleController());

  ArticleSingleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/img/programming.png'),
                // CachedNetworkImage(
                //   imageUrl:"t",
                //   imageBuilder: (context, imageProvider) {
                //     return Container(
                //       decoration: BoxDecoration(
                //         borderRadius:
                //         BorderRadius.all(Radius.circular(16)),
                //         image: DecorationImage(
                //             image: imageProvider, fit: BoxFit.cover),
                //       ),
                //     );
                //   },
                //   placeholder: (context, url) {
                //     return Loading();
                //   },
                //   errorWidget: (context, url, error) {
                //     return Center(
                //       child: Icon(
                //         Icons.image_not_supported_outlined,
                //         size: 50,
                //         color: Colors.grey,
                //       ),
                //     );
                //   },
                // ),
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
                        children: [
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
            Text(
              "رازهای سبلنسبلبل بلنسبلس سبلتسبلسل بت",
              maxLines: 2,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(
                children: [
                  Text("فاطمه امیری"),
                  SizedBox(
                    width: 16,
                  ),
                  Text("2 روز پیش"),
                ],
              ),
            ),
            
            HtmlWidget("html"),


          ],
        ),
      ),
    );
  }
}
