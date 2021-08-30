import 'package:flutter/material.dart';

import 'custom_text.dart';

class PlanFive extends StatefulWidget {
  final void Function(PlanFiveModel value) callback;
  PlanFive(this.callback);
  @override
  State<StatefulWidget> createState() {
    return PlanFiveState();
  }
}

class PlanFiveState extends State<PlanFive> {
  late List<PlanFiveModel> _models;
  late PlanFiveModel _selectedModel;

  @override
  void initState() {
    super.initState();
    _models = buildModel();
    changeSelected(1);
  }

  List<PlanFiveModel> buildModel() {
    List<PlanFiveModel> models = [];
    models.add(
      PlanFiveModel(0, '免安监条件', '调整系数', 0),
    );
    models.add(
      PlanFiveModel(1, '不免安监', '0.9', 0.9),
    );
    models.add(
      PlanFiveModel(2, '免两人（死亡伤残）', '1', 1),
    );
    models.add(
      PlanFiveModel(3, '全免安监', '1.2', 1.2),
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
          CustomText(
            padding: EdgeInsets.only(left: 10),
            title: model.column0_key,
            width: 200,
          ),
          CustomText(
            padding: EdgeInsets.only(left: 10),
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
          itemCount: 4),
    );
  }
}

class PlanFiveModel {
  int index;
  String column0_key;
  String column1_key;
  double column1_value;
  PlanFiveModel(
    this.index,
    this.column0_key,
    this.column1_key,
    this.column1_value,
  );
}
