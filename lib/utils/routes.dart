import 'package:flutter/material.dart';
import '../ui/screens/authentication/verify_email_view.dart';

import '../ui/screens/authentication/login_view.dart';
import '../ui/screens/authentication/registration_view.dart';
import '../ui/screens/landing_page/landing_page_view.dart';

const String landingPageRoute = '/landingPage';
const String loginPageRoute = '/loginPage';
const String registerPageRoute = '/registerPage';
const String verifyEmailRoute = '/verifyEmailPage';

Map<String, WidgetBuilder> routesMap = {
  loginPageRoute: (context) => const LoginPage(),
  landingPageRoute: (context) => const LandingPageView(),
  registerPageRoute: (context) => const RegistrationView(),
  verifyEmailRoute: (context) => const VerifyEmailView(),
};
