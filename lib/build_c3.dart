import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance_tool/custom_bottom.dart';

import 'build_c2.dart';
import 'custom_text.dart';

class BuildC3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BuildC3State();
  }
}

class _BuildC3State extends State<BuildC3> {
  late List<BuildCDataCustom> _datas;
  void initState() {
    super.initState();
    _datas = initDatas();
  }

  List<BuildCDataCustom> initDatas() {
    var d1i1 = BuildCDataItem(0, 1, "10万+1万");
    var d1i2 = BuildCDataItem(1, 2, "20万+2万");
    var d1i3 = BuildCDataItem(2, 3, "30万+3万");
    var d1i4 = BuildCDataItem(3, 4, "40万+4万");
    var d1i5 = BuildCDataItem(4, 5, "50万+5万");
    var d1i6 = BuildCDataItem(5, 6, "60万+6万");
    var d1i7 = BuildCDataItem(6, 7, "70万+7万");
    var d1i8 = BuildCDataItem(7, 8, "80万+8万");
    var d1i9 = BuildCDataItem(8, 9, "90万+9万");
    var d1i10 = BuildCDataItem(9, 10, "100万+10万");

    var d1 = BuildCDataCustom(0, "身故残疾+意外医疗", [
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

    var d2i1 = BuildCDataItem(0, 0.00018, "100万（不含) ~ 5000万（含）,0.0180%");
    var d2i2 = BuildCDataItem(1, 0.00015, "5000万（不含) ~ 1亿（含）,0.0150%");
    var d2i3 = BuildCDataItem(2, 0.000125, "1亿（不含) ~ 2亿（含）,0.0125%");
    var d2i4 = BuildCDataItem(3, 0.000118, "2亿以上 ,0.0118%");

    var d2 = BuildCDataCustom(1, "工程造价", [d2i1, d2i2, d2i3, d2i4]);

    var d3i1 = BuildCDataItem(0, 1, "不选, 保单总保费加费0%");
    var d3i2 = BuildCDataItem(1, 1, "50元/天, 保单总保费加费0%");
    var d3i3 = BuildCDataItem(2, 1.01, "100元/天, 保单总保费加费1%");
    var d3i4 = BuildCDataItem(3, 1.02, "150元/天, 保单总保费加费2%");

    var d3 = BuildCDataCustom(2, "可选：意外住院津贴", [d3i1, d3i2, d3i3, d3i4]);

    var d4i1 = BuildCDataItem(0, 1, "不选, 保单总保费加费0%");
    var d4i2 = BuildCDataItem(1, 1, "50元/天, 保单总保费加费0%");
    var d4i3 = BuildCDataItem(2, 1.01, "100元/天, 保单总保费加费1%");
    var d4i4 = BuildCDataItem(3, 1.02, "150元/天, 保单总保费加费2%");

    var d4 = BuildCDataCustom(3, "可选：误工津贴（安责险）", [d4i1, d4i2, d4i3, d4i4]);

    var d5i1 = BuildCDataItem(0, 0.8, "装饰、装修工程,最低保费 5000, 0.8");
    var d5i2 = BuildCDataItem(1, 1,
        "房屋建筑（包含配套工程，如主体、基坑、地基、基础工程、土石方、旧房改造）、市政工程（例如河道清淤，涉桥梁不超50%，市政水利工程等所有市政类工程）、消防工程、绿化工程, 最低保费 6000, 1");
    var d5i3 = BuildCDataItem(2, 2.5,
        "钢结构、电力工程（电网架设等）、市政类城市快速路工程（非野外高速路，隧道占比不超50%）, 最低保费 10000, 2.5");
    var d5i4 = BuildCDataItem(3, 3.5, "幕墙, 3.5");

    var d5 = BuildCDataCustom(4, "工程建设类型：", [d5i1, d5i2, d5i3, d5i4]);

    var d6i1 = BuildCDataItem(0, 1, "一级/二级施工资质, 1");
    var d6i2 = BuildCDataItem(1, 1.1, "三级施工资质, 保单总保费加费10%");

    var d6 = BuildCDataCustom(5, "施工资质：", [d5i1, d5i2]);

    var d7i1 = BuildCDataItem(0, 5, "劳务分包工程（纯劳务）, 5");
    var d7i2 = BuildCDataItem(1, 2.5, "劳务分包工程(分保合同包含物料）, 2.5");
    var d7i3 = BuildCDataItem(2, 1, "非劳务分包合同, 1");

    var d7 = BuildCDataCustom(6, "劳务分包类型：", [d7i1, d7i2, d7i3]);

    var d8i1 = BuildCDataItem(0, 0.8, "1个月（含）以下, 0.8");
    var d8i2 = BuildCDataItem(1, 0.9, "1个月以上至6个月（含）, 0.9");
    var d8i3 = BuildCDataItem(2, 1, "6个月以上至12个月（含）, 1");
    var d8i4 = BuildCDataItem(3, 1.1, "12个月以上, 1.1");

    var d8 = BuildCDataCustom(7, "工期调整", [d8i1, d8i2, d8i3, d8i4]);

    var d9i1 = BuildCDataItem(0, 1, "非云、贵、川、闽");
    var d9 = BuildCDataCustom(8, "地区:", [d9i1]);

    var d10i1 = BuildCDataItem(0, 1.05, "工标十级5%, 1.05");
    var d10i2 = BuildCDataItem(1, 1.1, "工标十级10%, 1.1");

    var d10 = BuildCDataCustom(9, "伤残赔偿标准:", [d10i1, d10i2]);

    var d11i1 = BuildCDataItem(0, 0.9, "不免安监, 0.9");
    var d11i2 = BuildCDataItem(1, 1, "免两人以下（含）, 1");
    var d11i3 = BuildCDataItem(2, 1.2, "全免安监, 1.2");

    var d11 = BuildCDataCustom(10, "免安监条件:", [d11i1, d11i2, d11i3]);

    var d12i1 = BuildCDataItem(0, 1, "不选, 1");
    var d12i2 = BuildCDataItem(1, 1.05, "工程造价一亿（含）以下, 附加30万保额, 1.05");
    var d12i3 = BuildCDataItem(2, 1.05, "工程造价一亿（含）以下, 附加50万保额, 1.05");

    var d12 = BuildCDataCustom(11, "可选：附加猝死系数", [d12i1, d12i2, d12i3]);

    return [d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12];
  }

  bool initialized = false;

  double b_price = -1;

  String getBPrice() {
    if (b_price <= 0) {
      return '点击获取方案报价';
    }
    var totalP = b_price * getFl();
    var copies = _datas[0].items[_datas[0].selectedIndex].itemValue;
    if (copies >= 10) {
      if (totalP < 7000) {
        totalP = 7000;
      }
    } else if (copies >= 8) {
      if (totalP < 6000) {
        totalP = 6000;
      }
    } else {
      if (totalP < 5000) {
        totalP = 5000;
      }
    }

    return '$totalP 元';
  }

  double getFl() {
    var fl = 1.0;

    for (int i = 0; i < 12; i++) {
      fl *= _datas[i].items[_datas[i].selectedIndex].itemValue;
    }
    return fl;
  }

  String getPlanDetail() {
    if (initialized == false) {
      return '';
    }
    var copies = _datas[0].items[_datas[0].selectedIndex].itemValue;
    var totalFl = getFl() / copies;
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
        getText(6) +
        getText(7) +
        getText(8) +
        getText(9) +
        getText(10) +
        getText(11);
  }

  String getText(int index) {
    return '${_datas[index].title}: ${_datas[index].items[_datas[index].selectedIndex].itemTitle}\n============\n';
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
          title: '建工安责框架',
          width: double.maxFinite,
        ),
      ),
      body: Container(
        width: width,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index < 12) {
              var data = _datas[index];
              return ListTile(
                title: CustomText(
                  title: data.title,
                  width: 100,
                ),
                trailing: PickerView(
                  data: data,
                  itemExtent: 40,
                  selectedCallback: (value) {
                    data.selectedIndex = value;
                    setState(() {});
                  },
                ),
              );
            } else if (index == 12) {
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
            } else if (index == 13) {
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
          itemCount: 15,
        ),
      ),
    );
  }
}
