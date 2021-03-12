//后台接口来源: https://www.heytap.com/cn/m/

import 'http_utils.dart';

// 获取首页轮播图数据
Future getHomePageSwiper([data, options]) async {
  return HttpUtils.get(
      'https://www.heytap.com/cn/oapi/configs/web/banners/040101,040201',
      data,
      options);
}
