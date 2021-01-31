import 'package:flutter/material.dart';

class ExpansionList extends StatefulWidget {
  @override
  _ExpansionListState createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  List<int> mList;
  List<ExpandStateBean> expandStateList;

  _ExpansionListState() {
    mList = new List();
    expandStateList = new List();
    for (var i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  void _setCurrentIndex(int index, isExpand) {
    setState(() {
      expandStateList[index].isOpen = !isExpand;
    });
  }

  @override
  Widget build(BuildContext context) {
    //最简单的滚动容器，ExpansionPanelList必须放在滚动容器中
    return SingleChildScrollView(
      child: ExpansionPanelList(
        //打开闭合回调
        expansionCallback: (index, bol) {
          _setCurrentIndex(index, bol);
        },
        children: mList.map((index) {
          return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text('This is No.$index'),
                );
              },
              body: ListTile(
                title: Text('expansion No.$index'),
              ),
              isExpanded: expandStateList[index].isOpen);
        }).toList(),
      ),
    );
  }
}

class ExpandStateBean {
  var isOpen;
  var index;
  ExpandStateBean(this.index, this.isOpen);
}
