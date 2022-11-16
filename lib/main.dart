import 'package:flutter/material.dart';

import 'screen/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'first_splash',
      routes: {
        'first_splash': (context) => const FirstSplash(),
        // 'second_splash': (context) => const FirstSplash(),
      },
    ),
  );
}
