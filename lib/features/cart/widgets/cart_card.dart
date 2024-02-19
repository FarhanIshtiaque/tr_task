import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tr_task/core/constants/app_colors.dart';
import 'package:tr_task/core/constants/text_styles.dart';
import 'package:tr_task/core/resource/widgets/primary_textfield.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.count,
    this.onTapIncrement, this.onTapDecrement,
  });

  final String imageUrl;
  final String title;
  final int price;
  final String count;
  final GestureTapCallback? onTapIncrement;
  final GestureTapCallback? onTapDecrement;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: 74.h,
                    width: 74.h,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: AppTextStyle.body2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.natural6,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap:onTapIncrement,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.natural2,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.add,
                                          size: 15,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    count,
                                    style: AppTextStyle.caption,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  InkWell(
                                    onTap: onTapDecrement,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.natural2,
                                          borderRadius: BorderRadius.circular(8)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.remove,
                                          size: 15,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            '\$ $price',
                            style: AppTextStyle.body2Medium,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const PrimaryTextField(
              // prefixIcon: Icon(Icons.note_alt_rounded),
              hintText: 'write note here',
            )
          ],
        ),
      ),
    );
  }
}
