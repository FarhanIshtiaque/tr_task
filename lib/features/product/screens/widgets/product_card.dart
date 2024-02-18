import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tr_task/core/constants/app_colors.dart';
import 'package:tr_task/core/constants/text_styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "https://api.faraaz.info/storage/CMS/1697960607.jpeg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Beef Cheese Burger Farhan',
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
                          '\$ 77',
                          style: AppTextStyle.captionMedium,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.natural6,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 9,),
                      child: Center(
                        child: Icon(
                          Icons.add_shopping_cart_rounded,
                          size: 18,
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
    );
  }
}