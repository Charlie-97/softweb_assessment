import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/routes.dart';
import '../../common/app_colors.dart';
import '../../common/app_textstyles.dart';
import '../../common/theming/gradients.dart';
import '../../common/widgets/app_back_button.dart';
import '../../common/widgets/app_button.dart';
import '../../common/widgets/gradient_text.dart';
import '../../common/widgets/registration_progress_bar.dart';
import '../../common/widgets/textfield_widget.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _referralController;

  bool _isLoading = false;
  bool _isPasswordVisible = true;
  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _referralController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _referralController.dispose();
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppBackButton(),
                  GestureDetector(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: appPrimaryOrange,
                          ),
                        ),
                      ),
                      child: GradientText(
                        gradient: orangeGradient,
                        text: 'Sign in instead',
                        style: AppTextstyles.bodyRegular
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(25),
              Text(
                'Create an acoount',
                style: AppTextstyles.authHeader.copyWith(
                  fontSize: 29,
                  height: 32 / 29,
                ),
              ),
              const Gap(25),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      controller: _firstNameController,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onChanged: (_) {
                        setState(() {});
                      },
                      label: 'First name',
                      hintText: 'First name',
                      validator: _fieldValidator,
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: TextFieldWidget(
                      controller: _lastNameController,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onChanged: (_) {
                        setState(() {});
                      },
                      label: 'Last name',
                      hintText: 'Last name',
                      validator: _fieldValidator,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              TextFieldWidget(
                controller: _phoneController,
                textInputType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                onChanged: (_) {
                  setState(() {});
                },
                label: 'Phone number',
                hintText: 'Enter phone number',
                validator: _fieldValidator,
              ),
              const Gap(20),
              TextFieldWidget(
                controller: _emailController,
                textInputType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
                label: 'Email address',
                hintText: 'Enter Email address',
                validator: _emailValidator,
              ),
              const Gap(20),
              TextFieldWidget(
                controller: _passwordController,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                onChanged: (_) {
                  setState(() {});
                },
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
                label: 'Create Password',
                hintText: 'Enter Password',
                obscureText: _isPasswordVisible,
              ),
              const Gap(20),
              TextFieldWidget(
                controller: _referralController,
                textInputType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.done,
                onChanged: (_) {
                  setState(() {});
                },
                label: 'Referral Code (Optional)',
                hintText: 'Enter Referral Code',
              ),
              const Gap(27),
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
                    Navigator.of(context).pushNamed(verifyEmailRoute);
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
                        'Next',
                        style: AppTextstyles.bodyRegular,
                      ),
              ),
              const Gap(32),
              const RegistrationProgressBar(
                currentStep: 1,
                stepTitle: 'Account information',
              ),
              const Gap(40),
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
        _passwordController.text.isNotEmpty &&
        _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty;
  }

  String? _emailValidator(String? email) {
    if (email != null) {
      if (_isValidEmail(email)) {
      } else {
        return 'Email is invalid';
      }
    } else {
      return 'Email can not be empty';
    }
    return null;
  }

  String? _fieldValidator(String? text) {
    if (text == null) {
      return 'Field cannot be empty';
    }

    return null;
  }
}
