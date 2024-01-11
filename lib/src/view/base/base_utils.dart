import 'package:flutter/material.dart';
import '../../../utils/style/app_colors.dart';

class BaseUtils {
  static PreferredSizeWidget appBar({Color? backgroundColor}) => AppBar(
        backgroundColor: backgroundColor ?? AppColors.kwhiteColor,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 28,
          color: AppColors.kwhiteColor,
        ),
      );
}
