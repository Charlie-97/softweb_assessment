import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_textstyles.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      // Routers.pop(context),
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: appGrey1,
          ),
          Text(
            'Back',
            style: AppTextstyles.bodyRegular.copyWith(
              color: appGrey1,
              height: 24 / 14,
              fontSize: 14,
              letterSpacing: -.002,
            ),
          ),
        ],
      ),
    );
  }
}
