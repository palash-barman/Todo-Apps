import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.mainColor,
        strokeWidth: 3,
      ),
    );
  }
}
