import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tr_task/core/constants/app_colors.dart';
import 'package:tr_task/core/constants/app_values.dart';
import 'package:tr_task/core/constants/text_styles.dart';
import 'package:tr_task/core/resource/widgets/primary_button.dart';
import 'package:tr_task/features/cart/controller/cart_controller.dart';
import 'package:tr_task/features/cart/widgets/cart_card.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late ConfettiController controllerTopCenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 4));
  }
  @override
  void dispose() {

    controllerTopCenter.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                  GetBuilder<CartController>(
                      init: CartController(),
                      builder: (cartController) {
                        return cartController.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return CartCard(
                                    imageUrl: cartController
                                        .cartList[index].imageUrl
                                        .toString(),
                                    title: cartController.cartList[index].name
                                        .toString(),
                                    price: cartController.cartList[index].price! *
                                        cartController.cartList[index].count!
                                            .toInt(),
                                    count: cartController.cartList[index].count
                                        .toString(),
                                    onTapIncrement: () {
                                      cartController.incrementProductAmount(
                                          index: index);
                                    },
                                    onTapDecrement: () {
                                      cartController.decrementProductAmount(
                                          index: index);
                                    },
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 16,
                                  );
                                },
                                itemCount: cartController.cartList.length);
                      }),
                  const SizedBox(
                    height: 52,
                  )
                ],
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: PrimaryButton(
              onPressed: () {
                controllerTopCenter.play();
                Get.snackbar('Hi !!!', 'Thanks for checking it out');
              },
              buttonNameWidget: const Text(
                'Go to payment',
                style: AppTextStyle.button2,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: controllerTopCenter,
            blastDirection: pi / 2,
            maxBlastForce: 5, // set a lower max blast force
            minBlastForce: 2, // set a lower min blast force
            emissionFrequency: 0.05,
            numberOfParticles: 50, // a lot of particles at once
            gravity: 1,
          ),
        ),
      ],
    );
  }
}
