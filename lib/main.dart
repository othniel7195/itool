import 'package:flutter/material.dart';
import 'package:insurance_tool/build_c1.dart';
import 'package:insurance_tool/custom_text.dart';
import 'package:insurance_tool/plan_five.dart';
import 'package:insurance_tool/plan_four.dart';
import 'package:insurance_tool/plan_one.dart';
import 'package:insurance_tool/plan_six.dart';
import 'package:insurance_tool/plan_three.dart';
import 'package:insurance_tool/plan_two.dart';
import 'package:insurance_tool/standard_plan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '保险工具',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  var listTitles = ['建工意外-标准费率', '建工意外险框架', '建工安责雇主框架'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: CustomText(
          padding: EdgeInsets.zero,
          title: '保险工具',
          width: 60,
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BuildC1()),
              );
            },
            child: ListTile(
              title: Text(listTitles[index]),
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
