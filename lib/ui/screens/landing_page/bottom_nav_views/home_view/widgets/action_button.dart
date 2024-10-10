import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:softweb_assessment/ui/common/app_textstyles.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.icon, required this.action});
  final String icon;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(icon, width: 20, height: 20,
        fit: BoxFit.scaleDown,),
        const Gap(4),
        Text(action, style: AppTextstyles.actionButton,),
      ],
    );
  }
}
