import 'package:flutter/material.dart';

import 'custom_text.dart';
import 'number_select.dart';

class StandardPlan extends StatefulWidget {
  final void Function(StandardPlanModel value) callback;
  StandardPlan({required this.callback});
  @override
  State<StatefulWidget> createState() {
    return StandardPlanState();
  }
}

class StandardPlanState extends State<StandardPlan> {
  late StandardPlanModel _selectedModel;
  late List<StandardPlanModel> _models;
  @override
  void initState() {
    super.initState();
    _models = buildModel();
    changeSelected(1);
  }

  List<StandardPlanModel> buildModel() {
    List<StandardPlanModel> models = [];
    models.add(
      StandardPlanModel(0, '保险项目', '保额', 0, '保险费率/年（按工程造价）', 0, '方案说明'),
    );
    models.add(
      StandardPlanModel(
          1,
          '意外身故、伤残 \n\n意外医疗\n\n意外伤害住院津贴',
          '10万\n\n1万\n\n100元/天',
          100000,
          '0.18‰',
          0.00018,
          '最高叠加购买10份；意外医疗跟随主险的10%；住院津贴限100/天'),
    );
    return models;
  }

  void changeSelected(int index, {int copies = 1}) {
    _selectedModel = _models[index];
    _selectedModel.copies = copies;
    widget.callback(_selectedModel);
  }

  Widget buildW(int index) {
    var model = _models[index];
    Widget w1 = CustomText(
      title: '选择方案',
      width: 20,
      padding: EdgeInsets.only(left: 5),
    );
    Widget w11 = CustomText(
      title: '购买份数',
      width: 30,
      padding: EdgeInsets.zero,
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
      width: 20,
    );

    Widget w22 = NumberControllerWidget(
      index: index,
      numText: '1',
      addValueChanged: (num) {},
      removeValueChanged: (num) {},
      updateValueChanged: (num) {
        if (num[1] == _selectedModel.index) {
          print("update value: $num");
          changeSelected(_selectedModel.index, copies: num[0]);
        }
      },
    );

    Widget w3;
    Widget w33;
    if (index == 0) {
      w3 = w1;
      w33 = w11;
    } else {
      w3 = w2;
      w33 = w22;
    }

    return Container(
      color: Colors.black12,
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(
            padding: EdgeInsets.only(left: 5),
            title: model.column0_key,
            width: 60,
          ),
          CustomText(
            padding: EdgeInsets.only(left: 5),
            title: model.column1_key,
            width: 40,
          ),
          CustomText(
            padding: EdgeInsets.only(left: 5),
            title: model.column2_key,
            width: 60,
          ),
          CustomText(
            padding: EdgeInsets.only(left: 5),
            title: model.column3_key,
            width: 75,
          ),
          w3,
          SizedBox(
            width: 5,
          ),
          w33,
        ],
      ),
      width: double.infinity,
      height: index == 0 ? 80 : 150,
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
          itemCount: 2),
    );
  }
}

class StandardPlanModel {
  int index = 1;
  String column0_key;
  String column1_key;
  double column1_value;
  String column2_key;
  double column2_value;
  String column3_key;

  int copies = 1;
  StandardPlanModel(
    this.index,
    this.column0_key,
    this.column1_key,
    this.column1_value,
    this.column2_key,
    this.column2_value,
    this.column3_key,
  );
}
