import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double width;
  final double? height;
  final EdgeInsets? padding;
  CustomText(
      {required this.title, required this.width, this.height, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(
        title,
        style: TextStyle(fontSize: 12, fontFamily: 'Noto'),
      ),
      width: width,
      height: height,
    );
  }
}
