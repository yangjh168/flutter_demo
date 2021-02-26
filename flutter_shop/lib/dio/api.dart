import 'http_utils.dart';

// 获取首页轮播图数据
Future getHomePageSwiper([data, options]) async {
  return HttpUtils.get('/sysParams/homeParamList', data, options);
}

//获取热门商品
Future getHotGoodsList([data, options]) async {
  return HttpUtils.get('/', data, options);
}
