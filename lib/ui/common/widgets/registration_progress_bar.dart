// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:softweb_assessment/ui/common/app_textstyles.dart';

import '../app_colors.dart';

class RegistrationProgressBar extends StatelessWidget {
  const RegistrationProgressBar({
    super.key,
    required this.currentStep,
    required this.stepTitle,
  });
  final int currentStep;
  final String stepTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: _RegistrationBar(
                color:
                    currentStep >= 1 ? appWhite : appDeepGrey,
                step: 1,
              ),
            ),
            const Gap(8),
            Expanded(
              child: _RegistrationBar(
                color:
                    currentStep >= 2 ? appWhite : appDeepGrey,
                step: 2,
              ),
            ),
          ],
        ),
        const Gap(16),
        Text(
          stepTitle,
          style: AppTextstyles.bodyLight,
        ),
      ],
    );
  }
}

class _RegistrationBar extends StatelessWidget {
  const _RegistrationBar({
    required this.color,
    required this.step,
  });
  final Color color;
  final int step;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: color,
      ),
    );
  }
}
