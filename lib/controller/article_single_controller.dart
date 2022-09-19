import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/models/article_info_model.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/view/article_single_screen.dart';

class SingleArcticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;

  getArticleInfo( var id) async {
    articleInfoModel = ArticleInfoModel().obs;
    // Get.to(ArticleSingleScreen());

    loading.value = true;
    var userId = '';
    debugPrint(ApiConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');
    //TODO user id is hard code

    var response = await DioService().getMethod(ApiConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;
    }
    Get.to(ArticleSingleScreen());
  }
}
