import 'package:get/get.dart';
import 'package:tr_task/core/helper/logger.dart';
import 'package:tr_task/core/resource/injection_container.dart';
import 'package:tr_task/core/resource/local_storage/local_storage.dart';
import '../data/cart_model.dart';

class CartController extends GetxController {
  var isLoading = false.obs;
  List<Cart> cartList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCartList();
  }

  getCartList() async {
    isLoading(true);
    cartList = await sl<LocalStorage>().fetchAllCarts();
    isLoading(false);
    update();
  }

  /// increment product amount with price when clicked on the plus button
  incrementProductAmount({required int index}) {
    cartList[index].count = (cartList[index].count! + 1);
    Cart cartData = Cart(
        id: cartList[index].id,
        name: cartList[index].name,
        price: cartList[index].price,
        imageUrl: cartList[index].imageUrl,
        count: cartList[index].count);

    sl<LocalStorage>().update(cartData);
    update();
  }

  decrementProductAmount({required int index}) {
    if (cartList[index].count == 1) {
      sl<LocalStorage>().delete(cartList[index].id!);
      cartList.removeAt(index);
    } else {
      cartList[index].count = (cartList[index].count! - 1);
      Cart cartData = Cart(
          id: cartList[index].id,
          name: cartList[index].name,
          price: cartList[index].price,
          imageUrl: cartList[index].imageUrl,
          count: cartList[index].count);

      sl<LocalStorage>().update(cartData);
    }

    update();
  }
}
