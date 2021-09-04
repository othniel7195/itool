import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance_tool/custom_bottom.dart';

import 'build_c2.dart';
import 'custom_text.dart';

class BuildNC1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BuildNC1State();
  }
}

class _BuildNC1State extends State<BuildNC1> {
  late List<BuildCDataCustom> _datas;
  //基础费率
  var _basicFL = 0.00018;
  void initState() {
    super.initState();
    _datas = initDatas();
  }

  List<BuildCDataCustom> initDatas() {
    var d1i1 = BuildCDataItem(0, 1, "10万+1万+100元/天");
    var d1i2 = BuildCDataItem(1, 2, "20万+2万+100元/天");
    var d1i3 = BuildCDataItem(2, 3, "30万+3万+100元/天");
    var d1i4 = BuildCDataItem(3, 4, "40万+4万+100元/天");
    var d1i5 = BuildCDataItem(4, 5, "50万+5万+100元/天");
    var d1i6 = BuildCDataItem(5, 6, "60万+6万+100元/天");
    var d1i7 = BuildCDataItem(6, 7, "70万+7万+100元/天");
    var d1i8 = BuildCDataItem(7, 8, "80万+8万+100元/天");
    var d1i9 = BuildCDataItem(8, 9, "90万+9万+100元/天");
    var d1i10 = BuildCDataItem(9, 10, "100万+10万+100元/天");

    var d1 = BuildCDataCustom(0, "意外身故、伤残+意外医疗+意外伤害住院津贴", [
      d1i1,
      d1i2,
      d1i3,
      d1i4,
      d1i5,
      d1i6,
      d1i7,
      d1i8,
      d1i9,
      d1i10,
    ]);

    var d2i1 = BuildCDataItem(0, 1, "1000万元以下, 1");
    var d2i2 = BuildCDataItem(1, 0.9, "1000万元-5000万元, 0.9");
    var d2i3 = BuildCDataItem(2, 0.8, "5001万元-10000万元, 0.8");
    var d2i4 = BuildCDataItem(3, 0.75, "10001万元-30000万元, 0.75");
    var d2i5 = BuildCDataItem(3, 0.7, "30001万元以上, 0.7");

    var d2 = BuildCDataCustom(1, "工程造价", [d2i1, d2i2, d2i3, d2i4, d2i5]);

    var d3i1 = BuildCDataItem(0, 0.8, "装饰、装修工程,最低保费 5000, 0.8");
    var d3i2 = BuildCDataItem(1, 1,
        "房屋建筑（包含配套工程，如主体、基坑装修、土石方）、市政工程（例如河道清淤等市政类工程）、消防工程、绿化工程, 最低保费 5000, 1");
    var d3i3 = BuildCDataItem(2, 1.15,
        "房屋建筑及配套工程、市政工程（不含涉桥梁的工程）、消防工程、绿化工程等类型的劳务分包工程（必须要包工包料）, 最低保费 6000, 1.15");
    var d3i4 = BuildCDataItem(3, 2.5,
        "拆除改造工程、钢结构、电力工程（不含电网架设）、市政类城市快速路工程（非野外高速路，不含隧道）, 最低保费 10000, 2.5");
    var d3i5 = BuildCDataItem(4, 3.5, "幕墙, 最低保费 10000, 3.5");
    var d3i6 = BuildCDataItem(5, 4,
        "市政类城市隧道工程（隧道占比低于30%）、桥梁工程（桥梁占比低于30%）、爆破工程以及此类包工包料的劳务分包工程, 最低保费 15000, 4");
    var d3i7 = BuildCDataItem(6, 5, "所有纯劳务分包合同（不含材料不分工程类型）, 最低保费 15000, 5");

    var d3 = BuildCDataCustom(
        2, "工程建设类型：", [d3i1, d3i2, d3i3, d3i4, d3i5, d3i6, d3i7]);

    var d4i1 = BuildCDataItem(0, 1, "三级（含以下）, 1");
    var d4i2 = BuildCDataItem(1, 0.9, "二级, 0.9");
    var d4i3 = BuildCDataItem(2, 0.85, "一级, 0.85");
    var d4i4 = BuildCDataItem(3, 0.8, "特级, 0.8");

    var d4 = BuildCDataCustom(3, "承包方资质：", [d4i1, d4i2, d4i3, d4i4]);

    var d5i1 = BuildCDataItem(0, 0.8, "180天以内, 0.8");
    var d5i2 = BuildCDataItem(1, 0.9, "181天-1年, 0.9");
    var d5i3 = BuildCDataItem(2, 1, "1年（超）-2年内, 1");
    var d5i4 = BuildCDataItem(3, 1.1, "2年（超）-3年内, 1.1");
    var d5i5 = BuildCDataItem(4, 1.2, "3年（超）-4年内, 1.2");
    var d5i6 = BuildCDataItem(5, 1.3, "4年（超）-5年内, 1.3");

    var d5 = BuildCDataCustom(4, "工程期限", [d5i1, d5i2, d5i3, d5i4, d5i5, d5i6]);

    var d6i1 = BuildCDataItem(0, 0.9, "不免安监, 0.9");
    var d6i2 = BuildCDataItem(1, 1, "免两人以下（含）, 1");
    var d6i3 = BuildCDataItem(2, 1.2, "全免安监, 1.2");

    var d6 = BuildCDataCustom(5, "免安监条件:", [d6i1, d6i2, d6i3]);

    var d7i1 = BuildCDataItem(0, 1,
        "人伤标准：伤残等级赔付标准对照《人身保险伤残评定标准及代码》（标准编号为JR/T0083－2013）。一级至十级分别为100%、90%、80%、70%、60%、50%、40%、30%、20%、10%。, 1");
    var d7i2 = BuildCDataItem(1, 1,
        "工伤标准：伤残等级赔付标准对照《劳动能力鉴定职工工伤与职业病致残等级》（GB/T16180-2014）标准为准，保险金伤残最高给付比例分为十档，伤残程度一级至十级分别为100%、80%、70%、60%、50%、40%、30%、20%、10%、5%。, 1");
    var d7i3 = BuildCDataItem(2, 1.1,
        "工伤标准：伤残等级赔付标准对照《劳动能力鉴定职工工伤与职业病致残等级》（GB/T16180-2014）标准为准，保险金伤残最高给付比例分为十档，伤残程度一级至十级分别为100%、90%、80%、70%、60%、50%、40%、30%、20%、10%。, 1.1");

    var d7 = BuildCDataCustom(6, "残疾赔偿标准", [d7i1, d7i2, d7i3]);

    return [d1, d2, d3, d4, d5, d6, d7];
  }

  bool initialized = false;

  double b_price = -1;

  String getBPrice() {
    if (b_price <= 0) {
      return '点击获取方案报价';
    }
    var totalFL = getFl();
    if (totalFL < 0.8) {
      totalFL = 0.8;
    }

    return '${b_price * totalFL * _basicFL * _datas[0].items[_datas[0].selectedIndex].itemValue} 元';
  }

  double getFl() {
    var fl = 1.0;

    for (int i = 1; i < 7; i++) {
      fl *= _datas[i].items[_datas[i].selectedIndex].itemValue;
    }
    return fl;
  }

  String getPlanDetail() {
    if (initialized == false) {
      return '';
    }
    var copies = _datas[0].items[_datas[0].selectedIndex].itemValue;
    var totalFl = getFl();
    if (totalFl < 0.8) {
      totalFl = 0.8;
    }
    var p0 = '总费率: $totalFl , 购买份数: $copies \n\n===========\n\n';
    var p1 =
        '保险项目:${_datas[0].title}; 保额: ${_datas[0].items[_datas[0].selectedIndex].itemTitle}\n============\n';

    return p0 +
        p1 +
        getText(1) +
        getText(2) +
        getText(3) +
        getText(4) +
        getText(5) +
        getText(6);
  }

  String getText(int index) {
    return '${_datas[index].title}: ${_datas[index].items[_datas[index].selectedIndex].itemTitle}\n============\n';
  }

  double itemHeight(int index) {
    var h = 40.0;
    if (index == 2) {
      h = 80.0;
    }
    if (index == 6) {
      h = 100;
    }

    return h;
  }

  @override
  Widget build(BuildContext context) {
    double width = window.physicalSize.width;
    if (width > 500) {
      width = 500;
    }
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: '建工意外-标准费率方案',
          width: double.maxFinite,
        ),
      ),
      body: Container(
        width: width,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index < 7) {
              var data = _datas[index];
              return ListTile(
                title: CustomText(
                  title: data.title,
                  width: 100,
                ),
                trailing: PickerView(
                  data: data,
                  itemExtent: itemHeight(index),
                  selectedCallback: (value) {
                    data.selectedIndex = value;
                    setState(() {});
                  },
                ),
              );
            } else if (index == 8) {
              return ListTile(
                title: CustomText(
                  title: "输入工程造价/元",
                  width: 80,
                ),
                trailing: Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  width: 240,
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
              );
            } else if (index == 9) {
              return ListTile(
                title: CustomText(
                  title: "方案报价:",
                  width: 80,
                ),
                trailing: GestureDetector(
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
                    width: 240,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: CustomText(
                      title: getBPrice(),
                      width: 200,
                      height: 40,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              );
            } else {
              return ListTile(
                title: CustomText(
                  title: getPlanDetail(),
                  width: double.maxFinite,
                ),
              );
            }
          },
          itemCount: 12,
        ),
      ),
    );
  }
}
