import 'package:flutter/material.dart';

import '../theming/gradients.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: MediaQuery.sizeOf(context).width * .75,
        height: MediaQuery.sizeOf(context).width * .65,
        decoration: const BoxDecoration(gradient: backgroundGradient),
      ),
    );
  }
}
