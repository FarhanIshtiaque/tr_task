import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:tr_task/config/network_service/network_service.dart';
import 'package:tr_task/core/constants/api_endpoints.dart';
import 'package:tr_task/features/product/data/product_list_model.dart';

class ProductListController extends GetxController{
  HttpService httpService = HttpService();
  var isLoading = false.obs;
  var productList = <ProductListModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    httpService.init();
    getProductList();
  }
  Future<void> getProductList() async {
    try {
      isLoading(true);
      final result =
      await httpService.request(url: ApiEndPoints.posts, method: Method.GET,);

      if (result != null) {
        if (result is Response) {
          var data = result.data;
          if (result.statusCode == 200) {

            for (var item in data) {
              productList.add(ProductListModel.fromJson(item));
            }

            isLoading(false);
          }
        } else {
          isLoading(false);
        }
      }
    } finally {
      isLoading(false);
    }
  }
}