import 'package:get/get.dart';
import 'package:tr_task/core/helper/logger.dart';
import 'package:tr_task/core/resource/local_storage/local_storage.dart';

import '../data/cart_model.dart';

class CartController extends GetxController{
  List<Cart> cartList = [];
  LocalStorage localStorage= LocalStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCartList();
  }


  getCartList()async{
    cartList = await localStorage.fetchAllCarts();
    logger.d(cartList);
    update();
  }
}