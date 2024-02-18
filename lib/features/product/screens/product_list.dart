import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tr_task/core/constants/app_colors.dart';
import 'package:tr_task/core/constants/text_styles.dart';
import 'package:tr_task/features/product/controller/product_list_controller.dart';
import 'package:tr_task/features/product/screens/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productListController = Get.put(ProductListController());
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      appBar: AppBar(
        title: const Text(
          'TR Shop',
          style: AppTextStyle.body2Medium,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Obx(
          () => productListController.isLoading.value
              ? const CircularProgressIndicator()
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .72,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 8),
                  itemCount: productListController.productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(
                      avatarUrl:
                          productListController.productList[index].thumbnail,
                      price: productListController.productList[index].id
                          .toString(), productName: productListController.productList[index].title,
                    );
                  }),
        ),
      ),
    );
  }
}
