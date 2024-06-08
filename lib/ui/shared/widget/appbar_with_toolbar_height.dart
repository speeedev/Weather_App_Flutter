import 'package:flutter/material.dart';

class AppBarWithToolbarHeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight + AppBar().preferredSize.height,
    );
  }
}