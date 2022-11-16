import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "aplanet",
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 2,
                color: Colors.white.withOpacity(0.65),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "We Love the Planet",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.75),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const Spacer(),
        Icon(
          Icons.menu,
          size: 35,
          color: Colors.white.withOpacity(0.75),
        ),
      ],
    );
  }
}
