import 'package:flutter/material.dart';
import 'package:insurance_tool/custom_text.dart';
import 'package:insurance_tool/plan_five.dart';
import 'package:insurance_tool/plan_four.dart';
import 'package:insurance_tool/plan_one.dart';
import 'package:insurance_tool/plan_six.dart';
import 'package:insurance_tool/plan_three.dart';
import 'package:insurance_tool/plan_two.dart';
import 'package:insurance_tool/standard_plan.dart';

class BuildC1 extends StatefulWidget {
  BuildC1({Key? key}) : super(key: key);

  @override
  _BuildC1State createState() => _BuildC1State();
}

class _BuildC1State extends State<BuildC1> {
  late StandardPlanModel _standardModel;
  late PlanOneModel _planOneModel;
  late PlanTwoModel _planTwoModel;
  late PlanThreeModel _planThreeModel;
  late PlanFourModel _planFourModel;
  late PlanFiveModel _planFiveModel;
  late PlanSixModel _planSixModel;

  bool initialized = false;

  double b_price = -1;

  String getBPrice() {
    if (b_price <= 0) {
      return '点击获取方案报价';
    }
    return '${b_price * getFl() * _standardModel.column2_value * _standardModel.copies} 元';
  }

  double getFl() {
    var fl = _planOneModel.column2_value *
        _planTwoModel.column2_value *
        _planThreeModel.column1_value *
        _planFourModel.column1_value *
        _planFiveModel.column1_value *
        _planSixModel.column1_value;
    if (fl < 0.8) {
      fl = 0.8;
    }
    return fl;
  }

  String getPlanDetail() {
    if (initialized == false) {
      return '';
    }
    var p0 = '总费率: ${getFl()} \n\n===========\n\n';
    var p1 =
        '保险项目:${_standardModel.column0_key}; 保额: ${_standardModel.column1_key}; 保险费率/年（按工程造价）:${_standardModel.column2_key}; 购买份数:${_standardModel.copies}\n============\n';
    var p2 =
        '工程建设类型:${_planOneModel.column0_key};最低保费:${_planOneModel.column1_key};调整系数:${_planOneModel.column2_key}\n============\n';
    var p3 =
        '工程造价:${_planTwoModel.column0_key};累计赔偿:${_planTwoModel.column1_key};调整系数:${_planTwoModel.column2_key}\n============\n';
    var p4 =
        '工期:${_planThreeModel.column0_key};调整系数:${_planThreeModel.column1_key}\n============\n';
    var p5 =
        '承包方资质:${_planFourModel.column0_key};调整系数:${_planFourModel.column1_key}\n============\n';
    var p6 =
        '免安监条件:${_planFiveModel.column0_key};调整系数:${_planFiveModel.column1_key}\n============\n';
    var p7 =
        '残疾赔偿标准:${_planSixModel.column0_key};调整系数:${_planSixModel.column1_key}\n';

    return p0 + p1 + p2 + p3 + p4 + p5 + p6 + p7;
  }

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
            SizedBox(
              child: StandardPlan(
                callback: (value) {
                  _standardModel = value;
                },
              ),
              width: double.infinity,
              height: 250,
            ),
            CustomText(
              padding: EdgeInsets.only(top: 0),
              title: '工程类型费率系数:',
              width: double.infinity,
              height: 20,
            ),
            SizedBox(
              child: PlanOne(
                (value) {
                  _planOneModel = value;
                },
              ),
              height: 500,
              width: double.infinity,
            ),
            CustomText(
              padding: EdgeInsets.only(top: 10),
              title: '工程造价调整系数及保单赔偿限额:',
              width: double.infinity,
              height: 30,
            ),
            SizedBox(
              child: PlanTwo(
                (v) {
                  _planTwoModel = v;
                },
              ),
              height: 350,
              width: double.infinity,
            ),
            CustomText(
              padding: EdgeInsets.only(top: 10),
              title: '工程期限系数:',
              width: double.infinity,
              height: 30,
            ),
            SizedBox(
              child: PlanThree(
                (v) {
                  _planThreeModel = v;
                },
              ),
              height: 390,
              width: double.infinity,
            ),
            CustomText(
              padding: EdgeInsets.only(top: 10),
              title: '承包方（被保险人）施工资质系数:',
              width: double.infinity,
              height: 30,
            ),
            SizedBox(
              child: PlanFour(
                (v) {
                  _planFourModel = v;
                },
              ),
              height: 280,
              width: double.infinity,
            ),
            CustomText(
              padding: EdgeInsets.only(top: 0),
              title: '免安监证明条件系数:',
              width: double.infinity,
              height: 20,
            ),
            SizedBox(
              child: PlanFive(
                (v) {
                  _planFiveModel = v;
                },
              ),
              height: 230,
              width: double.infinity,
            ),
            CustomText(
              padding: EdgeInsets.only(top: 0),
              title: '残疾标准系数:',
              width: double.infinity,
              height: 20,
            ),
            SizedBox(
              child: PlanSix(
                (v) {
                  _planSixModel = v;
                },
              ),
              height: 440,
              width: double.infinity,
            ),
            CustomText(
              padding: EdgeInsets.only(top: 10),
              title: '方案说明:',
              width: double.infinity,
              height: 30,
            ),
            CustomText(
              padding: EdgeInsets.zero,
              title: '1、本方案总费率下浮不得超过20%',
              width: double.infinity,
              height: 20,
            ),
            CustomText(
              padding: EdgeInsets.zero,
              title: '2、云贵川等地不建议做，一单一议',
              width: double.infinity,
              height: 20,
            ),
            Container(
              height: 40,
              padding: EdgeInsets.only(top: 10),
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "输入工程款xxx 表示xxx元",
                  prefixIcon: Icon(Icons.money),
                ),
                onChanged: (v) {
                  if (v.isEmpty == false) {
                    if (double.tryParse(v) != null) {
                      b_price = double.parse(v);
                    }
                  }
                },
              ),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  CustomText(
                    padding: EdgeInsets.only(left: 10),
                    title: "方案报价:",
                    width: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      initialized = true;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        border: Border.all(width: 1),
                      ),
                      height: 40,
                      width: 200,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: CustomText(
                        title: getBPrice(),
                        width: 200,
                        height: 40,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomText(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
              title: getPlanDetail(),
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
