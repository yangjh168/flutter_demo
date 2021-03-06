import 'package:flutter_shop/pages/goods/goods_detail.dart';
import 'package:flutter_shop/pages/webview/webview_page.dart';
import 'package:flutter_shop/pages/goods/goods_search.dart';

var routers = [
  {
    'keys': ['skuId'],
    'path': '/goodsDetailPage',
    'builder': (params) => GoodsDetail(skuId: int.parse(params['skuId'])),
  },
  {
    'keys': ['url', 'title'],
    'path': '/webviewPage',
    'builder': (params) =>
        WebViewPage(url: params['url'], title: params['title']),
  },
  {
    'keys': ['query'],
    'path': '/searchPage',
    'builder': (params) => SearchPage(query: params['query']),
  },
];
