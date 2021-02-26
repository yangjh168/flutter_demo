import 'dio_utils.dart';

class HttpUtils {
  //get 请求
  static Future get<T>(String url, [data, options]) {
    return _request(Method.GET, url, data, options);
  }

  //post 请求
  static Future post<T>(String url, [data, options]) {
    return _request(Method.POST, url, data, options);
  }

  //_request 请求
  static Future _request<T>(Method method, String url, [data, options]) {
    /// restful 请求处理
    /// /base/search/hist/:user_id        user_id=27
    /// 最终生成 url 为     /base/search/hist/27
    if (data != null) {
      data.forEach((key, value) {
        if (url.indexOf(key) != -1) {
          url = url.replaceAll(':$key', value.toString());
        }
      });
    }
    // 参数处理
    // LogUtils.d("--------- data ---------");
    // LogUtils.d("$data");
    return DioUtils.request(method, url, data, options);
  }
}
