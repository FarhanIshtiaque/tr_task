import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tr_task/core/constants/app_colors.dart';
import 'package:tr_task/core/constants/text_styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.avatarUrl, required this.price, required this.productName, this.onTapCard, this.onTapCartIcon,
  });
  final String avatarUrl;
  final String price;
  final String productName;
  final GestureTapCallback? onTapCard;
  final GestureTapCallback? onTapCartIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 96.h,
                  width: double.maxFinite,
                  child: CachedNetworkImage(
                    imageUrl:
                  avatarUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                productName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.captionMedium,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(

                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.natural6,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 9,),
                        child: Center(
                          child: Text(
                            '\$ $price',
                            style: AppTextStyle.captionMedium,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: onTapCartIcon,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.natural6,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 9,),
                          child: Center(
                            child: Icon(
                              Icons.add_shopping_cart_rounded,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}