import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/dio/api.dart';
import 'package:flutter_shop/routers/routers.dart';

class SearchPage extends StatefulWidget {
  final String query;

  SearchPage({Key key, this.query}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _queryTextController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  String query;
  List hotList;

  @override
  void initState() {
    super.initState();
    _getHotSearchList();
    setState(() {
      query = widget.query ?? '';
    });
  }

  //获取热门搜索列表
  void _getHotSearchList() async {
    var res = await getHotSearchList();
    setState(() {
      hotList = res;
    });
  }

  // 显示搜索结果
  void showResults(BuildContext context) {
    _focusNode?.unfocus();
    // _currentBody = _SearchBody.results;
    String keyword = _queryTextController.text;
    // 跳转到搜索结果页
    Routes.navigateTo(context, '/searchResultPage',
        params: {"keyword": keyword}).then((result) {});
  }

  //关闭搜索
  void close(BuildContext context, dynamic result) {
    // _currentBody = null;
    _focusNode?.unfocus();
    Routes.pop(context, result);
    // Navigator.of(context)
    //   // ..popUntil((Route<dynamic> route) => route == _route)
    //   ..pop(result);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      explicitChildNodes: true,
      scopesRoute: true,
      namesRoute: true,
      label: '搜索',
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).primaryTextTheme,
          brightness: Theme.of(context).primaryColorBrightness,
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios_outlined,
            ),
            onTap: () {
              print('点击返回');
              close(context, null);
            },
          ),
          leadingWidth: 50.0.w,
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0.w)),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            constraints: BoxConstraints(maxHeight: 34),
            alignment: Alignment.center,
            child: TextField(
              controller: _queryTextController,
              focusNode: _focusNode,
              onSubmitted: (String _) {
                ////同样是点击键盘完成按钮时触发的回调，该回调有参数，参数即为当前输入框中的值。(String){}
                showResults(context);
              },
              onChanged: (val) {},
              style: TextStyle(fontSize: 26.0.sp),
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2),
                focusColor: Colors.black,
                border: InputBorder.none,
                hintText: '请输入',
                hintStyle: TextStyle(fontSize: 26.0.sp),
                prefixIcon: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.search, color: Colors.black45),
                ),
                prefixStyle: TextStyle(fontSize: 24.sp),
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.camera_alt_outlined, color: Colors.black45),
                ),
                suffixStyle: TextStyle(fontSize: 24.sp),
              ),
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(right: 20.0.w),
              child: Center(
                child: GestureDetector(
                  child: Text("搜索", style: TextStyle(color: Colors.black)),
                  onTap: () {
                    showResults(context);
                  },
                ),
              ),
            ),
          ],
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _searchBody(context),
        ),
      ),
    );
  }

  Widget _searchBody(BuildContext context) {
    if (hotList != null && hotList.isNotEmpty) {
      return Container(
        color: Colors.white,
        child: _hotWrapList(),
      );
    } else {
      return KeyedSubtree(
        // key: const ValueKey<_SearchBody>(_SearchBody.suggestions),
        child: buildSuggestions(context),
      );
    }
  }

  //热门搜索列表
  Widget _hotWrapList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20.0.w),
          alignment: Alignment.centerLeft,
          child: Text('热门搜索', style: TextStyle(color: Color(0xFF666666))),
        ),
        Container(
          padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 20.0.w),
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: 20.0.w,
            runSpacing: 20.0.w,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: hotList.map((item) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _queryTextController.text = item['title'];
                    showResults(context);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0.w))),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0.w, horizontal: 20.0.w),
                  child: Text(
                    '${item['title']}',
                    style:
                        TextStyle(fontSize: 24.0.sp, color: Color(0xFF666666)),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget buildSuggestions(BuildContext context) {
    // final suggestionList = query.isEmpty
    //     ? recentSuggest
    //     : searchList.where((input) => input.startsWith(query)).toList();
    // return ListView.builder(
    //     itemCount: suggestionList.length,
    //     itemBuilder: (context, index) => ListTile(
    //           title: RichText(
    //             text: TextSpan(
    //                 text: suggestionList[index].substring(0, query.length),
    //                 style: TextStyle(
    //                     color: Colors.black, fontWeight: FontWeight.bold),
    //                 children: [
    //                   TextSpan(
    //                       text: suggestionList[index].substring(query.length),
    //                       style: TextStyle(color: Colors.grey))
    //                 ]),
    //           ),
    //         ));
    return Center(
      child: Text('搜索内容'),
    );
  }
}
