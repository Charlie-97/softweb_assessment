import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:softweb_assessment/ui/common/theming/gradients.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.onTap,
    this.icon,
    this.isActive = true,
    this.height,
  });
  final Widget text;
  final Function()? onTap;
  final Widget? icon;
  final bool isActive;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 48,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: isActive ? null : Colors.grey,
          gradient: isActive ? buttonGradient : null,
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(
          //   width: 1.5.px,
          //   color: kcPrimaryColor,
          // )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text,
            const Gap(4),
            icon ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
