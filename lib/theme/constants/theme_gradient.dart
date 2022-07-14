import 'package:e_commerce_electronics/theme/constants/theme_colors.dart';
import 'package:flutter/material.dart';

abstract class ThemeGradient {
  static const LinearGradient productCart =LinearGradient(
            colors: [
              ThemeColors.cartProductGradientOne,
              ThemeColors.cartProductGradienTwo,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          );
  
}