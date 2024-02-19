import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tr_task/core/constants/app_colors.dart';
import 'package:tr_task/core/constants/app_values.dart';
import 'package:tr_task/core/constants/text_styles.dart';
import 'package:tr_task/core/resource/widgets/primary_button.dart';
import 'package:tr_task/core/resource/widgets/primary_textfield.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: AppTextStyle.body2Medium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
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
                                      imageUrl:
                                          'https://dummyimage.com/200x200/FFFFFF/lorem-ipsum.png&text=jsonplaceholder.org',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Flexible(
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Beef Cheese Burger Farh...fa fafaf afaf a',
                                        style: AppTextStyle.body2,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.natural6,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 15,
                                                        color: AppColors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  const Text(
                                                    '1',
                                                    style: AppTextStyle.caption,
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Icon(
                                                        Icons.remove,
                                                        size: 15,
                                                        color: AppColors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(
                                            '\$ 70',
                                            style: AppTextStyle.body2Medium,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 12,),
                            const PrimaryTextField(
                             // prefixIcon: Icon(Icons.note_alt_rounded),
                              hintText: 'write note here',
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: 5),
              SizedBox(height: 52,)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: PrimaryButton(
          onPressed: () {},
          buttonNameWidget: const Text(
            'Go to payment',
            style: AppTextStyle.button2,
          ),
        ),
      ),
    );
  }
}
