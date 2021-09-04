import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'build_c2.dart';
import 'custom_text.dart';

bool PickerViewiSShow = false;

class PickerView extends StatefulWidget {
  final void Function(int index) selectedCallback;
  final BuildCDataCustom data;
  final double itemExtent;
  PickerView(
      {required this.data,
      this.itemExtent = 40,
      required this.selectedCallback});
  @override
  _PickerViewState createState() {
    return _PickerViewState();
  }
}

class _PickerViewState extends State<PickerView> {
  int _selectedIndexV = 0;

  void dispose() {
    PickerViewiSShow = false;
    super.dispose();
  }

  Widget pickerWidget() {
    var data = widget.data;
    return Container(
      height: 330,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                height: 30,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    PickerViewiSShow = false;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10),
                    color: Colors.amber,
                    child: CustomText(
                      title: "取消",
                      width: 60,
                      height: 30,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                height: 30,
                child: GestureDetector(
                  onTap: () {
                    widget.selectedCallback(_selectedIndexV);
                    Navigator.of(context).pop();
                    PickerViewiSShow = false;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10),
                    color: Colors.amber,
                    child: CustomText(
                      title: "完成",
                      width: 60,
                      height: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 300,
            child: Center(
              child: CupertinoPicker(
                itemExtent: widget.itemExtent,
                offAxisFraction: 0.0,
                squeeze: 1.25,
                diameterRatio: 1.07,
                backgroundColor: Colors.black12,
                selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                  background: Colors.amber.withAlpha(88),
                ),
                onSelectedItemChanged: (value) {
                  _selectedIndexV = value;
                },
                children: data.items.map(
                  (i) {
                    return Container(
                      width: double.maxFinite,
                      child: Center(
                          child: Text(
                        i.itemTitle,
                        style: TextStyle(fontSize: 14, fontFamily: 'Noto'),
                      )),
                    );
                  },
                ).toList(),
                looping: false,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void didShow() {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        PickerViewiSShow = true;
        return pickerWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var selectedItem = widget.data.items[widget.data.selectedIndex];
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black12,
        primary: Colors.black,
        textStyle: TextStyle(
          fontSize: 12,
          fontFamily: 'Noto',
        ),
      ),
      child: CustomText(
        title: selectedItem.itemTitle,
        width: 220,
      ),
      onPressed: () {
        if (PickerViewiSShow) {
          Navigator.of(context).pop();
          PickerViewiSShow = false;
        }
        didShow();
        setState(() {});
      },
    );
  }
}
