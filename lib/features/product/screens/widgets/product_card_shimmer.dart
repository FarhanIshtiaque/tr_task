import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tr_task/core/constants/app_colors.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({
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
        child: Shimmer.fromColors(
          baseColor: AppColors.gray100,
          highlightColor: AppColors.white,
          child: Column(
            children: [
              Container(
                height: 96.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.primary
                ),
              ),
              const SizedBox(
                height: 12,
              ),
             Container(height: 38,
             width: double.maxFinite,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(6),
               color: AppColors.primary
             ),),
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
                        child:Container(
                          height: 15,
                          width: 10,
                          
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
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