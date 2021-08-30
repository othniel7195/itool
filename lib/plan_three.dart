import 'package:flutter/material.dart';

import 'custom_text.dart';

class PlanThree extends StatefulWidget {
  final void Function(PlanThreeModel value) callback;
  PlanThree(this.callback);
  @override
  State<StatefulWidget> createState() {
    return PlanThreeState();
  }
}

class PlanThreeState extends State<PlanThree> {
  late List<PlanThreeModel> _models;
  late PlanThreeModel _selectedModel;

  @override
  void initState() {
    super.initState();
    _models = buildModel();
    changeSelected(1);
  }

  List<PlanThreeModel> buildModel() {
    List<PlanThreeModel> models = [];
    models.add(
      PlanThreeModel(0, '工期', '调整系数', 0),
    );
    models.add(
      PlanThreeModel(1, '180天以内', '0.8', 0.8),
    );
    models.add(
      PlanThreeModel(2, '181天-1年', '0.9', 0.9),
    );
    models.add(
      PlanThreeModel(3, '1年（超）-2年内', '1', 1),
    );
    models.add(
      PlanThreeModel(4, '2年（超）-3年内', '1.1', 1.1),
    );
    models.add(
      PlanThreeModel(5, '3年（超）-4年内', '1.2', 1.2),
    );
    models.add(
      PlanThreeModel(5, '4年（超）-5年内', '1.3', 1.3),
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
      width: 50,
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
      width: 50,
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
          SizedBox(
            width: 10,
          ),
          CustomText(
            title: model.column0_key,
            width: 200,
          ),
          SizedBox(
            width: 10,
          ),
          CustomText(
            title: model.column1_key,
            width: 100,
          ),
          SizedBox(
            width: 10,
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
          itemCount: 7),
    );
  }
}

class PlanThreeModel {
  int index;
  String column0_key;
  String column1_key;
  double column1_value;
  PlanThreeModel(
    this.index,
    this.column0_key,
    this.column1_key,
    this.column1_value,
  );
}
