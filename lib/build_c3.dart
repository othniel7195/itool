import 'package:flutter/material.dart';

import 'custom_text.dart';

class BuildC3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BuildC3State();
  }
}

class _BuildC3State extends State<BuildC3> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            CustomText(
              padding: EdgeInsets.only(top: 10),
              title: '标准费率方案:',
              width: double.infinity,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class BuildC3P1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BuildC3P1State();
  }
}

class _BuildC3P1State extends State<BuildC3P1> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ));
  }
}
