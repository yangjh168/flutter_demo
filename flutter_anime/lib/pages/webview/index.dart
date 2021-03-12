// 参考链接：https://www.jianshu.com/p/4aabe453eb26

import 'package:flutter/material.dart';
import 'package:flutter_anime/routers/routers.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String kNavigationExamplePage = '''javascript:(function() {
      var brde = document.getElementsByTagName('brde');
      brde[0].style.display = 'none';
      let uId = brde[0].id;
      var fDom = document.querySelectorAll("."+uId+"_f");
      for(let index=fDom.length-1;index>=0;index--){
        let items = fDom[index];
        items.remove();
      }
      var h5game = document.querySelectorAll(".h5game");
      for(let index=h5game.length-1;index>=0;index--){
        let h5items = h5game[index];
        h5items.remove();
      }
      document.querySelector('#ad_i90l0631428gi3z52v').remove();
    })()''';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;
  const WebViewPage({Key key, this.url, this.title}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController _controller;
  // double _height = 100;
  // double _width = 100;
  double lineProgress = 0.0;

  @override
  void initState() {
    super.initState();
    // PageLoadingCallback(progress){
    //   print(progress);
    //     setState(() {
    //       lineProgress = progress;
    //     });
    // }
  }

  Widget _progressBar(double progress, BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.white70.withOpacity(0),
      value: progress == 1.0 ? 0 : progress,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            title: Text("${widget.title}"),
            bottom: PreferredSize(
              child: _progressBar(lineProgress, context),
              preferredSize: Size.fromHeight(3.0),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Routes.pop(context);
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            actions: <Widget>[
              NavigationControls(controller: _controller),
            ],
          ),
          body: WebView(
            // 要显示的url
            initialUrl: widget.url,
            //JS执行模式 是否允许JS执行
            javascriptMode: JavascriptMode.unrestricted,
            //WebView创建完成时调用
            onWebViewCreated: (controller) {
              setState(() {
                _controller = controller;
              });
              // 更换加载URL
              // _controller.loadUrl(Uri.dataFromString(htmlStr,
              //         mimeType: 'text/html',
              //         encoding: Encoding.getByName('utf-8'))
              //     .toString());
            },
            // 页面加载完成
            onPageFinished: (url) {
              //调用JS得到实际高度
              _controller
                  .evaluateJavascript("document.documentElement.clientHeight;")
                  .then((result) {
                print("返回结果" + result.toString());
                // setState(() {
                //   _height = double.parse(result);
                // });
              });
              //执行过滤广告
              _controller.loadUrl(kNavigationExamplePage);
            },
            //拦截请求
            navigationDelegate: (NavigationRequest request) {
              //对于需要拦截的操作 做判断
              if (request.url.startsWith("myapp://")) {
                print("即将打开 ${request.url}");
                // 做拦截处理
                // Application.push(context, request.url);
                return NavigationDecision.prevent;
              }
              print('加载链接：' + request.url);
              //不需要拦截的操作
              return NavigationDecision.navigate;
            },
            //使用javascriptChannel JS可以调用Flutter
            javascriptChannels: <JavascriptChannel>[
              JavascriptChannel(
                  name: "share",
                  onMessageReceived: (JavascriptMessage message) {
                    print("参数： ${message.message}");
                  }),
            ].toSet(),
            // 手势
            // gestureRecognizers
          )),
      onWillPop: () async {
        //点击物理返回键
        print('canGoBack' + _controller.canGoBack().toString());
        if (await _controller.canGoBack()) {
          await _controller.goBack();
          return false;
        } else {
          return true;
        }
      },
    );
  }
}

// 导航工具栏
class NavigationControls extends StatelessWidget {
  final WebViewController controller;

  NavigationControls({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller != null) {
      return Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () async {
              if (await controller.canGoBack()) {
                await controller.goBack();
              } else {
                return;
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () async {
              if (await controller.canGoForward()) {
                await controller.goForward();
              } else {
                return;
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.replay),
            onPressed: () {
              controller.reload();
            },
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
