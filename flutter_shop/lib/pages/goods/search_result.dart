import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/dio/api.dart';
import 'package:flutter_shop/routers/routers.dart';
import 'package:flutter_shop/widget/linkImage.dart';

class SearchResultPage extends StatefulWidget {
  final String keyword;

  SearchResultPage({Key key, this.keyword}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchResultPage> {
  TextEditingController _queryTextController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  String keyword = '';
  List resultList = [];
  int page = 1;
  int pageSize = 10;

  @override
  void initState() {
    super.initState();
    setState(() {
      keyword = widget.keyword ?? '';
      _queryTextController.text = keyword;
      _getResultData(keyword);
    });
  }

  // 显示搜索结果
  void showResults(BuildContext context) {
    _focusNode?.unfocus();
    // _currentBody = _SearchBody.results;
    String query = _queryTextController.text;
    setState(() {
      keyword = query;
      page = 1;
      resultList = [];
      _getResultData(keyword);
    });
  }

  //获取搜索结果
  void _getResultData(String keyword) async {
    var res = await getSearchResultList(
        {'keyword': keyword, 'currentPage': page, 'pageSize': pageSize});
    setState(() {
      resultList.addAll((res[0]['productDetailss'] as List).cast());
      page++;
    });
  }

  //关闭搜索
  void close(BuildContext context, dynamic result) {
    // _currentBody = null;
    _focusNode?.unfocus();
    Navigator.of(context)
      // ..popUntil((Route<dynamic> route) => route == _route)
      ..pop(result);
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
        body: EasyRefresh(
          footer: BezierBounceFooter(),
          child: buildResultList(context),
          onLoad: () async {
            _getResultData(keyword);
          },
        ),
      ),
    );
  }

  Widget buildResultList(BuildContext context) {
    if (resultList != null && resultList.isNotEmpty) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20.0.w, left: 20.0.w),
          child: Wrap(
            children: resultList.map((item) {
              return Container(
                width: 344.w,
                margin: EdgeInsets.only(right: 20.0.w, bottom: 20.0.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.white),
                child: InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 250.0.w,
                          child: LinkImage(url: item['url']),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w),
                          height: 65.h,
                          child: Text(item['title'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center),
                        ),
                        Text(
                          '￥${item["price"] == 99999 ? item["marketPrice"] : item["price"]}',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Routes.navigateTo(context, '/goodsDetailPage',
                        params: {"skuId": item['skuId']}).then((result) {
                      // if (result != null) {
                      //   print(result);
                      // }
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),
      );
    } else {
      return Center(
        child: Text('搜索内容'),
      );
    }
  }
}
