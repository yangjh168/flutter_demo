import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountStepper extends StatefulWidget {
  final int num;
  final ValueChanged<int> onValueChanged;

  CountStepper({Key key, this.num = 0, this.onValueChanged}) : super(key: key);

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
      height: 60.0.h,
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
              width: 50.0.w,
              alignment: Alignment.center,
              child: Icon(Icons.remove_rounded,
                  color: currentNum == 0 ? Colors.black12 : Colors.black,
                  size: 24.sp),
            ),
          ),
          Container(
            width: 0.5.w,
            color: Colors.grey,
          ),
          Container(
            width: 80.0.w,
            alignment: Alignment.center,
            child: Text('$currentNum',
                maxLines: 1,
                style: TextStyle(fontSize: 32.0.sp, color: Colors.black)),
          ),
          Container(
            width: 0.5.w,
            color: Colors.grey,
          ),
          GestureDetector(
            onTap: _addNum,
            child: Container(
              width: 50.0.w,
              alignment: Alignment.center,
              child: Icon(Icons.add, size: 24.sp),
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
