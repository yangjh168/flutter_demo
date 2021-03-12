import 'package:flutter_anime/pages/test/index.dart';
import 'package:flutter_anime/pages/webview/index.dart';

var routers = [
  {
    'path': '/webviewPage',
    'keys': ['url', 'title'],
    'builder': (params) =>
        WebViewPage(url: params['url'], title: params['title']),
  },
  {
    'path': '/webViewExample',
    'keys': [],
    'builder': () => WebViewExample(),
  },
];
