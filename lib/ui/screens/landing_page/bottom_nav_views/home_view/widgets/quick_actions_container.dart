import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:softweb_assessment/ui/common/app_textstyles.dart';

class QuickActionsContainer extends StatelessWidget {
  const QuickActionsContainer(
      {super.key, required this.icon, required this.action});
  final String icon;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 78,
      height: 75,
      decoration: BoxDecoration(
        color: const Color(0xFF282828),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            fit: BoxFit.scaleDown,
            width: 24,
            height: 24,
          ),
          Text(
            action,
            style: AppTextstyles.bodyRegular.copyWith(
              fontWeight: FontWeight.w300,
              height: 24 / 14,
              letterSpacing: -0.003,
            ),
          ),
        ],
      ),
    );
  }
}
