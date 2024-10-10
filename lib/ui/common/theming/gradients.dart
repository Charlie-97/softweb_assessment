import 'package:flutter/material.dart';

import '../app_colors.dart';

final LinearGradient orangeGradient = LinearGradient(
  colors: [
    appLightOrange.withOpacity(1),
    appPrimaryOrange.withOpacity(1),
  ],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);

final LinearGradient buttonGradient = LinearGradient(
  colors: [
    appLightOrange.withOpacity(1),
    appPrimaryOrange.withOpacity(1),
  ],
  begin: Alignment.bottomRight,
  end: Alignment.topCenter,
);

const RadialGradient backgroundGradient = RadialGradient(
  colors: [Color(0xFF69695F), Color(0xFF442F28), appBlack],
  center: Alignment.topRight,
  radius: 1,
);
