import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tr_task/config/routes/app_pages.dart';
import 'package:tr_task/features/product/screens/product_list.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.PRODUCTLIST, page: () => const ProductList()),


  ];
}
