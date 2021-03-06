import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  final TextEditingController _queryTextController = TextEditingController();
  final String query;

  SearchPage({Key key, this.query}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  FocusNode focusNode = FocusNode();
  String query;

  @override
  void initState() {
    super.initState();
    query = widget.query ?? '';
  }

  void showResults(BuildContext context) {
    // _focusNode?.unfocus();
    // _currentBody = _SearchBody.results;
  }

  // void close(BuildContext context, T result) {
  //   // _currentBody = null;
  //   // _focusNode?.unfocus();
  //   Navigator.of(context)
  //     // ..popUntil((Route<dynamic> route) => route == _route)
  //     ..pop(result);
  // }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Semantics(
      explicitChildNodes: true,
      scopesRoute: true,
      namesRoute: true,
      label: '搜索',
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: Theme.of(context).primaryIconTheme,
          textTheme: Theme.of(context).primaryTextTheme,
          brightness: Theme.of(context).primaryColorBrightness,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
            ),
            onPressed: () => {
              // close(context, null),
            },
          ),
          title: TextField(
            controller: widget._queryTextController,
            focusNode: focusNode,
            style: theme.textTheme.headline6,
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.text,
            onSubmitted: (String _) {
              ////同样是点击键盘完成按钮时触发的回调，该回调有参数，参数即为当前输入框中的值。(String){}
              showResults(context);
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '请输入',
              hintStyle: TextStyle(fontSize: 24.0.sp),
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(right: 20.0.w),
              child: Center(
                child: GestureDetector(
                  child: Text("搜索"),
                ),
              ),
            ),
          ],
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: KeyedSubtree(
            // key: const ValueKey<_SearchBody>(_SearchBody.suggestions),
            child: buildSuggestions(context),
          ),
        ),
      ),
    );
  }

  Widget buildSuggestions(BuildContext context) {
    // final suggestionList = query.isEmpty
    //     ? recentSuggest
    //     : searchList.where((input) => input.startsWith(query)).toList();
    final suggestionList = [];
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
              title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: suggestionList[index].substring(query.length),
                          style: TextStyle(color: Colors.grey))
                    ]),
              ),
            ));
  }
}
