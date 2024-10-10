import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../../common/app_assets.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_textstyles.dart';
import '../../../../../common/theming/gradients.dart';
import '../../../../../common/widgets/gradient_text.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({super.key});

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool _isBalanceVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        gradient: orangeGradient,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'WALLET BALANCE',
                  style: AppTextstyles.bodySmall.copyWith(
                    fontWeight: FontWeight.w400,
                    color: appWhite,
                    height: 20 / 10,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'NGN ${_isBalanceVisible ? '50,000' : '***'}',
                      style: AppTextstyles.bodyRegular.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: -.002,
                        height: 24 / 16,
                      ),
                    ),
                    const Gap(7),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isBalanceVisible = !_isBalanceVisible;
                        });
                      },
                      child: Icon(
                        _isBalanceVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 16,
                        color: appWhite,
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: appWhite.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Cashback ',
                          style: AppTextstyles.bodySmall.copyWith(
                            color: appBlackShade,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: GradientText(
                            gradient: orangeGradient,
                            text: 'N341.20',
                            style: AppTextstyles.bodySmall.copyWith(
                              // color: const Color(0xFF242424),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            color: appDeepOrange.withOpacity(0.6),
            width: 1,
            height: 69,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(11, 7, 13, 14),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: appWhite.withOpacity(.2),
                // gradient: orangeGradient,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MONIEPOINT',
                    style: AppTextstyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w400,
                      color: appWhite,
                      height: 20 / 10,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '8192017482',
                        style: AppTextstyles.bodyRegular.copyWith(
                          fontWeight: FontWeight.w900,
                          letterSpacing: -.002,
                          height: 19.2 / 16,
                        ),
                      ),
                      SvgPicture.asset(
                        copyIcon,
                        fit: BoxFit.scaleDown,
                      )
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: appWhite,
                        width: .6,
                      ),
                    )),
                    child: Text(
                      'Deposit Fee: N20',
                      style: AppTextstyles.bodySmall.copyWith(
                        fontWeight: FontWeight.w400,
                        color: appWhite,
                        height: 12 / 10,
                        // decoration: TextDecoration.underline,
                        // decorationColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
