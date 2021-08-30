import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class PlanTwo extends StatefulWidget {
  final void Function(PlanTwoModel value) callback;
  PlanTwo(this.callback);
  @override
  State<StatefulWidget> createState() {
    return PlanTwoState();
  }
}

class PlanTwoState extends State<PlanTwo> {
  late List<PlanTwoModel> _models;
  late PlanTwoModel _selectedModel;

  @override
  void initState() {
    super.initState();
    _models = buildModel();
    changeSelected(1);
  }

  List<PlanTwoModel> buildModel() {
    List<PlanTwoModel> models = [];
    models.add(
      PlanTwoModel(0, '工程造价', '累计赔偿', 0, '调整系数', 0),
    );
    models.add(
      PlanTwoModel(1, '1000万元以下', '1000万', 10000000, '1', 1),
    );
    models.add(
      PlanTwoModel(2, '1000万元-5000万元', '2000万', 20000000, '0.9', 0.9),
    );
    models.add(
      PlanTwoModel(3, '5001万元-10000万元', '3000万', 30000000, '0.8', 0.8),
    );
    models.add(
      PlanTwoModel(4, '10001万元-30000万元', '4000万', 40000000, '0.75', 0.75),
    );
    models.add(
      PlanTwoModel(5, '30001万元以上', '5000万以上（或工程造价的20%）', 50000000, '0.7', 0.7),
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
            width: 5,
          ),
          CustomText(
            title: model.column0_key,
            width: 150,
          ),
          SizedBox(
            width: 5,
          ),
          CustomText(
            title: model.column1_key,
            width: 80,
          ),
          SizedBox(
            width: 5,
          ),
          CustomText(
            title: model.column2_key,
            width: 50,
          ),
          SizedBox(
            width: 5,
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
          itemCount: 6),
    );
  }
}

class PlanTwoModel {
  int index;
  String column0_key;
  String column1_key;
  double column1_value;
  String column2_key;
  double column2_value;
  PlanTwoModel(
    this.index,
    this.column0_key,
    this.column1_key,
    this.column1_value,
    this.column2_key,
    this.column2_value,
  );
}
