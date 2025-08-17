import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../pages/chada_buzz_app.dart';

PreferredSizeWidget? customAppBar(final double deviceWidth) => AppBar(
  scrolledUnderElevation: 0,
  elevation: 0,
  title: Column(
    children: [
      Text(
            "Money Splitter",
            style: TextStyle(color: Colors.white, letterSpacing: 2),
          )
          .animate()
          .slideY(duration: 400.ms, delay: 400.ms)
          .animate()
          .fade(duration: 400.ms, delay: 400.ms),
      SizedBox(
        width: deviceWidth / 3,
        child: Divider(thickness: 0.5, color: Colors.white)
            .animate()
            .slideX(duration: 300.ms, delay: 300.ms)
            .animate()
            .fadeIn(duration: 300.ms, delay: 300.ms),
      ),
    ],
  ),
  centerTitle: true,
  backgroundColor: primaryColor,
);
