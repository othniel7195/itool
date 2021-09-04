import 'package:flutter/material.dart';
import 'package:insurance_tool/build_c1.dart';
import 'package:insurance_tool/build_c3.dart';
import 'package:insurance_tool/custom_text.dart';
import 'build_c2.dart';
import 'build_nc1.dart';

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

  var listTitles = ['建工意外-标准费率(原始版本)', '建工意外-标准费率', '建工意外险框架', '建工安责雇主框架'];
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
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuildC1()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuildNC1()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuildC2()),
                );
              } else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuildC3()),
                );
              }
            },
            child: ListTile(
              title: Text(listTitles[index]),
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }
}
