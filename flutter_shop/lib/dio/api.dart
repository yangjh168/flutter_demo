//后台接口来源: https://www.heytap.com/cn/m/

import 'http_utils.dart';

// 获取首页轮播图数据
Future getHomePageSwiper([data, options]) async {
  return HttpUtils.get(
      'https://www.heytap.com/cn/oapi/configs/web/banners/040101,040201',
      data,
      options);
}

//获取热门商品
Future getHotGoodsList([data, options]) async {
  return HttpUtils.get(
      'https://www.heytap.com/cn/oapi/goods/web/info/search/keyword/040110?keyword=%E6%89%8B%E6%9C%BA&currentPage=4&pageSize=10',
      data,
      options);
}

//获取商品分类
Future getCateGoryList([data, options]) async {
  return HttpUtils.get(
      'https://www.heytap.com/cn/oapi/goods/web/products/010206,010225,010226,010227,010228,010229,010237,010230,010231,010233,010236,010234,010232,010235',
      data,
      options);
}

//获取商品详情
Future getGoodsDetail([data, options]) async {
  return HttpUtils.get(
      'https://www.heytap.com/cn/oapi/goods/web/info/skuId', data, options);
}

//获取我的功能菜单
Future getMemberMenuList([data, options]) async {
  return HttpUtils.get(
      'https://www.heytap.com/cn/oapi/goods/web/products/040401',
      data,
      options);
}

//获取热门搜索列表
Future getHotSearchList([data, options]) async {
  return HttpUtils.get(
      'https://www.heytap.com/cn/oapi/configs/web/icons/040109', data, options);
}

//获取搜索结果列表
Future getSearchResultList([data, options]) async {
  return HttpUtils.get(
      'https://www.heytap.com/cn/oapi/goods/web/info/search/keyword/040110',
      data,
      options);
}
