import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/controller_validators.dart';
import '../../../utils/routes.dart';
import '../../common/app_colors.dart';
import '../../common/app_textstyles.dart';
import '../../common/theming/gradients.dart';
import '../../common/widgets/app_button.dart';
import '../../common/widgets/gradient_text.dart';
import '../../common/widgets/textfield_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ControllerValidators {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: appDeepGrey2,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const Gap(24),
              const Text(
                'Welcome back 👋🏾',
                style: AppTextstyles.authHeader,
              ),
              const Gap(72),
              TextFieldWidget(
                controller: _emailController,
                textInputType: TextInputType.emailAddress,
                textStyle: AppTextstyles.bodyRegular,
                label: 'Email',
                hintText: 'Enter Email address',
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
                validator: _emailValidator,
                onChanged: (_) {
                  setState(() {});
                },
                height: 76,
              ),
              const Gap(24),
              TextFieldWidget(
                controller: _passwordController,
                textInputType: TextInputType.visiblePassword,
                textStyle: AppTextstyles.bodyRegular,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: appWhite,
                  ),
                ),
                label: 'Password',
                hintText: "Enter your password",
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.done,
                obscureText: _isPasswordVisible,
                onChanged: (_) {
                  setState(() {});
                },
                height: 76,
              ),
              const Gap(8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: appGrey1,
                    height: 24 / 14,
                  ),
                ),
              ),
              const Gap(32),
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
                    Navigator.of(context)
                        .pushReplacementNamed(landingPageRoute);
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
                        'Sign In',
                        style: AppTextstyles.bodyRegular,
                      ),
              ),
              const Gap(16),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "I don't have an account, ",
                      style: AppTextstyles.bodyRegular.copyWith(
                        color: appGrey1,
                        fontSize: 14,
                        height: 20 / 14,
                        letterSpacing: -0.002,
                      ),
                    ),
                    WidgetSpan(
                      baseline: TextBaseline.alphabetic,
                      alignment: PlaceholderAlignment.baseline,
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.of(context).pushNamed(registerPageRoute),
                        child: GradientText(
                          gradient: orangeGradient,
                          text: 'Create Account',
                          style: AppTextstyles.bodyRegular.copyWith(
                            color: appGrey1,
                            fontSize: 14,
                            height: 20 / 14,
                            letterSpacing: -0.002,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
    // Regular expression for a simple email validation
    final RegExp emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
      caseSensitive: false,
      multiLine: false,
    );

    return emailRegExp.hasMatch(email);
  }

  bool _isButtonActive() {
    return _isValidEmail(_emailController.text) &&
        _passwordController.text.isNotEmpty;
  }

  String? _emailValidator(String? email) {
    if (email != null) {
      if (_isValidEmail(email)) {
      } else {
        return 'Email is incorrect';
      }
    } else {
      return 'Email can not be empty';
    }
    return null;
  }
}
