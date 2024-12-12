import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/configs/theme/app_colors.dart';

class BasicLoading extends StatelessWidget {
  const BasicLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: AppColors.primary,
            )
          ],
        )
      ],
    );
  }
}
