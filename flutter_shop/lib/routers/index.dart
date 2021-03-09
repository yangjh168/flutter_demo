import 'package:flutter_shop/pages/goods/goods_detail.dart';
import 'package:flutter_shop/pages/goods/search_result.dart';
import 'package:flutter_shop/pages/webview/webview_page.dart';
import 'package:flutter_shop/pages/goods/goods_search.dart';

var routers = [
  {
    'path': '/goodsDetailPage',
    'keys': ['skuId'],
    'builder': (params) => GoodsDetail(skuId: int.parse(params['skuId'])),
  },
  {
    'path': '/webviewPage',
    'keys': ['url', 'title'],
    'builder': (params) =>
        WebViewPage(url: params['url'], title: params['title']),
  },
  {
    'path': '/searchPage',
    'keys': ['query'],
    'builder': (params) => SearchPage(query: params['query']),
  },
  {
    'path': '/searchResultPage',
    'keys': ['keyword'],
    'builder': (params) => SearchResultPage(keyword: params['keyword']),
  },
];
