// 参考链接：https://www.jianshu.com/p/4aabe453eb26

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;
  const WebViewPage({Key key, this.url, this.title}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController _controller;
  double _height = 100;
  // double _width = 100;
  String htmlStr = """<p>ListView中的webview_flutter要放在SizedBox中，指定并指定sizedbox的高度，
                      否则会出错。<span style="color:#e74c3c">实际高度可以调用js来获得返回的高度
                      </span></p>

                      <p><img alt="" src="http://10.0.2.2:8000/media/imgs/2019-12-05.png"  /></p>""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.title}"),
        ),
        body: WebView(
          // 要显示的url
          initialUrl: widget.url,
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
          //WebView创建完成时调用
          onWebViewCreated: (controller) {
            _controller = controller;
            // 更换加载URL
            // controller.loadUrl(Uri.dataFromString(htmlStr,
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
              setState(() {
                _height = double.parse(result);
                print("高度$_height");
              });
            });
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
        ));
  }
}
