import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:softweb_assessment/ui/common/app_colors.dart';
import 'package:softweb_assessment/ui/common/app_textstyles.dart';
import 'package:softweb_assessment/ui/common/widgets/app_back_button.dart';
import 'package:softweb_assessment/ui/common/widgets/app_button.dart';
import 'package:softweb_assessment/ui/common/widgets/registration_progress_bar.dart';
import 'package:softweb_assessment/utils/routes.dart';

import '../../common/theming/pin_theme.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  late final TextEditingController _otpController;
  bool _isLoading = false;
  @override
  void initState() {
    _otpController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlack,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.fromLTRB(24, 59, 23, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBackButton(),
            const Gap(56),
            const Text(
              'Verify your email',
              style: AppTextstyles.authHeader,
            ),
            const Gap(16),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Please enter the OTP sent to\n',
                    style: AppTextstyles.bodyRegular.copyWith(
                      color: appGrey1,
                      height: 24 / 16,
                    ),
                  ),
                  TextSpan(
                    text: 'sampleemail@gmail.com',
                    style: AppTextstyles.bodyRegular.copyWith(
                      fontWeight: FontWeight.w500,
                      height: 24 / 16,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(32),
            Pinput(
              length: 6,
              controller: _otpController,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) {
                while (index == 2) {
                  return const Text(
                    ' - ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      height: 28.8 / 24,
                      color: appGrey2,
                    ),
                  );
                }
                return const SizedBox(
                  width: 8,
                );
              },
              focusedPinTheme: focusedPinTheme,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onChanged: (value) {
                setState(() {});
              },
            ),
            const Spacer(),
            AppButton(
              isActive: _isButtonActive(),
              onTap: () async {
                setState(() {
                  _isLoading = true;
                });
                await Future.delayed(
                  const Duration(seconds: 3),
                );
                setState(() {
                  _isLoading = false;
                });
                if (context.mounted) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    loginPageRoute,
                    (route) => false,
                  );
                }
              },
              text: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: appWhite,
                        strokeWidth: 1,
                        strokeCap: StrokeCap.round,
                      ),
                    )
                  : const Text(
                      'Verify email',
                      style: AppTextstyles.bodyRegular,
                    ),
            ),
            const Gap(32),
            const RegistrationProgressBar(
              currentStep: 2,
              stepTitle: 'Email verification',
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }

  bool _isButtonActive() {
    if (_otpController.text.length == 6) {
      return true;
    } else {
      return false;
    }
  }
}
