import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:tr_task/config/network_service/network_service.dart';
import 'package:tr_task/core/constants/api_endpoints.dart';
import 'package:tr_task/core/constants/app_colors.dart';
import 'package:tr_task/core/resource/injection_container.dart';
import 'package:tr_task/core/resource/local_storage/local_storage.dart';
import 'package:tr_task/features/cart/data/cart_model.dart';
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

  /// add product to sqflite database
  addToCart(Cart cart)async{

    bool status = await sl<LocalStorage>().addCart(cart);
    if(status){
      Get.snackbar("Success", 'Product added to cart',backgroundColor: AppColors.success500);
    }else{
      Get.snackbar("Failed", 'Product already added in cart',backgroundColor: AppColors.success500);
    }

  }
}