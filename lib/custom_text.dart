import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double width;
  CustomText({required this.title, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        title,
        style: TextStyle(fontSize: 12, fontFamily: 'Noto'),
      ),
      width: width,
    );
  }
}
