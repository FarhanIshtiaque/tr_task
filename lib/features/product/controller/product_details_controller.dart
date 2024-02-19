import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:tr_task/config/network_service/network_service.dart';
import 'package:tr_task/core/constants/api_endpoints.dart';
import 'package:tr_task/features/product/data/product_list_model.dart';

class ProductDetailsController extends GetxController{
  HttpService httpService = HttpService();
  var isLoading = false.obs;
  late ProductModel productDetails;
  // arguments
  final productId = Get.arguments;


  @override
  void onInit() {
    super.onInit();
    httpService.init();
    getProductDetails(id: productId);
  }


  /// get list of products from api
  Future<void> getProductDetails({required int id}) async {
    try {
      isLoading(true);
      final result =
      await httpService.request(url: '${ApiEndPoints.posts}/$id', method: Method.GET,);

      if (result != null) {
        if (result is Response) {
          var data = result.data;
          if (result.statusCode == 200) {
            productDetails = ProductModel.fromJson(data);
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