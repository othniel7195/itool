import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance_tool/custom_text.dart';

class PlanOne extends StatefulWidget {
  final void Function(PlanOneModel value) callback;
  PlanOne(this.callback);
  @override
  State<StatefulWidget> createState() {
    return PlanOneState();
  }
}

class PlanOneState extends State<PlanOne> {
  late List<PlanOneModel> _models;
  late PlanOneModel _selectedModel;

  @override
  void initState() {
    super.initState();
    _models = buildModel();
    changeSelected(1);
  }

  List<PlanOneModel> buildModel() {
    List<PlanOneModel> models = [];
    models.add(
      PlanOneModel(0, '工程建设类型', '最低保费', 0, '调整系数', 0),
    );
    models.add(
      PlanOneModel(1, '装饰、装修工程', '5000', 5000, '0.8', 0.8),
    );
    models.add(
      PlanOneModel(2, '套工程，如主体、基坑装修、土石方）、市政工程（例如河道清淤等市政类工程）、消防工程、绿化工程', '5000',
          5000, '1', 1),
    );
    models.add(
      PlanOneModel(3, '房屋建筑及配套工程、市政工程（不含涉桥梁的工程）、消防工程、绿化工程等类型的劳务分包工程（必须要包工包料）',
          '6000', 6000, '1.15', 1.15),
    );
    models.add(
      PlanOneModel(4, '拆除改造工程、钢结构、电力工程（不含电网架设）、市政类城市快速路工程（非野外高速路，不含隧道）',
          '10000', 10000, '2.5', 2.5),
    );
    models.add(
      PlanOneModel(5, '幕墙', '10000', 10000, '3.5', 3.5),
    );
    models.add(
      PlanOneModel(
          6,
          '市政类城市隧道工程（隧道占比低于30%）、桥梁工程（桥梁占比低于30%）、爆破工程以及此类包工包料的劳务分包工程',
          '15000',
          15000,
          '4',
          4),
    );
    models.add(
      PlanOneModel(7, '所有纯劳务分包合同（不含材料不分工程类型）', '15000', 15000, '5', 5),
    );
    return models;
  }

  void changeSelected(int index) {
    _selectedModel = _models[index];
    widget.callback(_selectedModel);
  }

  Widget buildW(int index) {
    Widget w1 = CustomText(
      title: '选择方案',
      width: 30,
      padding: EdgeInsets.only(left: 5),
    );
    Widget w2 = SizedBox(
      child: Checkbox(
        value: _selectedModel.index == index,
        onChanged: (bool) {
          if (bool == true) {
            changeSelected(index);
            setState(() {});
          }
        },
      ),
      width: 30,
    );

    Widget w3;
    if (index == 0) {
      w3 = w1;
    } else {
      w3 = w2;
    }

    var model = _models[index];

    return Container(
      color: Colors.black12,
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            padding: EdgeInsets.only(left: 5),
            title: model.column0_key,
            width: 220,
          ),
          CustomText(
            padding: EdgeInsets.only(left: 5),
            title: model.column1_key,
            width: 80,
          ),
          CustomText(
            padding: EdgeInsets.only(left: 5),
            title: model.column2_key,
            width: 50,
          ),
          w3,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return buildW(index);
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
                height: 1,
              ),
          itemCount: 8),
    );
  }
}

class PlanOneModel {
  int index;
  String column0_key;
  String column1_key;
  double column1_value;
  String column2_key;
  double column2_value;

  PlanOneModel(
    this.index,
    this.column0_key,
    this.column1_key,
    this.column1_value,
    this.column2_key,
    this.column2_value,
  );
}
