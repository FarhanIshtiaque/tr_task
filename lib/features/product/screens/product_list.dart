import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_task/config/routes/app_pages.dart';
import 'package:tr_task/core/constants/app_colors.dart';
import 'package:tr_task/core/constants/text_styles.dart';
import 'package:tr_task/features/product/controller/product_list_controller.dart';
import 'package:tr_task/features/product/screens/widgets/product_card.dart';
import 'package:tr_task/features/product/screens/widgets/product_card_shimmer.dart';

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
          IconButton(onPressed: () {Get.toNamed(Routes.CART);}, icon: const Icon(Icons.shopping_cart,color: AppColors.black,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Obx(
          () => productListController.isLoading.value

          /// shimmer loading effect on loading
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .72,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 8),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return const ProductCardShimmer();
                  })
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
                          .toString(),
                      productName:
                          productListController.productList[index].title,
                      onTapCard: (){
                        Get.toNamed(Routes.PRODUCTDETAILS,arguments: productListController.productList[index].id);
                      },
                    );
                  }),
        ),
      ),
    );
  }
}
