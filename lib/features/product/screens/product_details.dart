import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tr_task/config/routes/app_pages.dart';
import 'package:tr_task/core/constants/app_colors.dart';
import 'package:tr_task/core/constants/app_values.dart';
import 'package:tr_task/core/constants/text_styles.dart';
import 'package:tr_task/core/resource/widgets/primary_button.dart';
import 'package:tr_task/features/product/controller/product_details_controller.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetailsController = Get.put(ProductDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: AppTextStyle.body2Medium,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.CART);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: AppColors.black,
              ))
        ],
      ),
      body: Obx(
        () => productDetailsController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppValues.padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 221.h,
                          width: double.maxFinite,
                          child: CachedNetworkImage(
                            imageUrl:
                                productDetailsController.productDetails.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        productDetailsController.productDetails.title,
                        style: AppTextStyle.headline4,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        '\$ ${productDetailsController.productDetails.id}',
                        style: AppTextStyle.body1Bold,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Description',
                        style: AppTextStyle.body1Bold,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        productDetailsController.productDetails.content,
                        style: AppTextStyle.caption,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      PrimaryButton(
                          onPressed: () {},
                          buttonNameWidget: const Text(
                            'Add to cart',
                            style: AppTextStyle.button2,
                          )),
                      const SizedBox(height: 40,),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
