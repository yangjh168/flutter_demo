import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountStepper extends StatefulWidget {
  final double height;
  final int num;
  final ValueChanged<int> onValueChanged;

  CountStepper({Key key, this.height = 60.0, this.num = 0, this.onValueChanged})
      : super(key: key);

  @override
  _CountStepperState createState() {
    return _CountStepperState();
  }
}

class _CountStepperState extends State<CountStepper> {
  int currentNum;
  @override
  void initState() {
    super.initState();
    setState(() {
      currentNum = widget.num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: _minusNum,
            child: Container(
              width: 32.0,
              alignment: Alignment.center,
              child: Icon(Icons.remove_rounded,
                  color: currentNum == 0 ? Colors.black12 : Colors.black),
            ),
          ),
          Container(
            width: 0.5,
            color: Colors.grey,
          ),
          Container(
            width: 90.0.w,
            alignment: Alignment.center,
            child: Text('$currentNum',
                maxLines: 1,
                style: TextStyle(fontSize: 34.0.sp, color: Colors.black)),
          ),
          Container(
            width: 0.5,
            color: Colors.grey,
          ),
          GestureDetector(
            onTap: _addNum,
            child: Container(
              width: 32.0,
              alignment: Alignment.center,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void _minusNum() {
    if (currentNum == 0) {
      return;
    }
    print('点击-1');
    setState(() {
      currentNum -= 1;
      if (widget.onValueChanged != null) {
        widget.onValueChanged(currentNum);
      }
    });
  }

  void _addNum() {
    print('点击+1');
    setState(() {
      currentNum += 1;
      if (widget.onValueChanged != null) {
        widget.onValueChanged(currentNum);
      }
    });
  }
}
