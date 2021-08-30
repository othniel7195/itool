import 'package:flutter/material.dart';

import 'custom_text.dart';

class PlanFour extends StatefulWidget {
  final void Function(PlanFourModel value) callback;
  PlanFour(this.callback);
  @override
  State<StatefulWidget> createState() {
    return PlanFourState();
  }
}

class PlanFourState extends State<PlanFour> {
  late List<PlanFourModel> _models;
  late PlanFourModel _selectedModel;

  @override
  void initState() {
    super.initState();
    _models = buildModel();
    changeSelected(1);
  }

  List<PlanFourModel> buildModel() {
    List<PlanFourModel> models = [];
    models.add(
      PlanFourModel(0, '承包方资质', '调整系数', 0),
    );
    models.add(
      PlanFourModel(1, '三级（含以下）', '1', 1),
    );
    models.add(
      PlanFourModel(2, '二级', '0.9', 0.9),
    );
    models.add(
      PlanFourModel(3, '一级', '0.85', 0.85),
    );
    models.add(
      PlanFourModel(4, '特级', '0.8', 0.8),
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
          itemCount: 5),
    );
  }
}

class PlanFourModel {
  int index;
  String column0_key;
  String column1_key;
  double column1_value;
  PlanFourModel(
    this.index,
    this.column0_key,
    this.column1_key,
    this.column1_value,
  );
}
