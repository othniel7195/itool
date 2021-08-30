import 'package:flutter/material.dart';

import 'custom_text.dart';

class PlanSix extends StatefulWidget {
  final void Function(PlanSixModel value) callback;
  PlanSix(this.callback);
  @override
  State<StatefulWidget> createState() {
    return PlanSixState();
  }
}

class PlanSixState extends State<PlanSix> {
  late List<PlanSixModel> _models;
  late PlanSixModel _selectedModel;

  @override
  void initState() {
    super.initState();
    _models = buildModel();
    changeSelected(1);
  }

  List<PlanSixModel> buildModel() {
    List<PlanSixModel> models = [];
    models.add(
      PlanSixModel(
        0,
        '残疾赔偿标准',
        '调整系数',
        0,
      ),
    );
    models.add(
      PlanSixModel(
        1,
        '人伤标准：伤残等级赔付标准对照《人身保险伤残评定标准及代码》（标准编号为JR/T0083－2013）。一级至十级分别为100%、90%、80%、70%、60%、50%、40%、30%、20%、10%。',
        '1',
        1,
      ),
    );
    models.add(
      PlanSixModel(
        2,
        '工伤标准：伤残等级赔付标准对照《劳动能力鉴定职工工伤与职业病致残等级》（GB/T16180-2014）标准为准，保险金伤残最高给付比例分为十档，伤残程度一级至十级分别为100%、80%、70%、60%、50%、40%、30%、20%、10%、5%。',
        '1',
        1,
      ),
    );
    models.add(
      PlanSixModel(
        3,
        '工伤标准：伤残等级赔付标准对照《劳动能力鉴定职工工伤与职业病致残等级》（GB/T16180-2014）标准为准，保险金伤残最高给付比例分为十档，伤残程度一级至十级分别为100%、90%、80%、70%、60%、50%、40%、30%、20%、10%。',
        '1.1',
        1.1,
      ),
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
          itemCount: 4),
    );
  }
}

class PlanSixModel {
  int index;
  String column0_key;
  String column1_key;
  double column1_value;
  PlanSixModel(
    this.index,
    this.column0_key,
    this.column1_key,
    this.column1_value,
  );
}
