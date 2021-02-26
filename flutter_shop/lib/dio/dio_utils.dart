// 参考：https://www.jianshu.com/p/e011c45bfaf1
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import '../config/index.dart';
// import 'log_utils.dart';

const int _connectTimeout = 15000; //15s
const int _receiveTimeout = 15000;
const int _sendTimeout = 10000;

//请求api前缀
const String _apiPrefix = serviceHost;

class DioUtils {
  // default options
  static const String TOKEN = '';

  static Dio _dio;

  /// 自定义Header
  static Map<String, dynamic> _httpHeaders = {
    'Accept': 'application/json,*/*',
    'Content-Type': 'application/json',
    'token': DioUtils.TOKEN
  };

  // 创建 dio 实例对象
  static Dio createInstance() {
    if (_dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        // 请求的Content-Type，默认值是"application/json; charset=utf-8".
        // 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
        // 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]就会自动编码请求体.
        // contentType: Headers.formUrlEncodedContentType, // 适用于post form表单提交
        responseType: ResponseType.json,
        validateStatus: (status) {
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
        baseUrl: _apiPrefix,
        headers: _httpHeaders,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout,
      );
      _dio = new Dio(options);
    }
    return _dio;
  }

  // 清空 dio 对象
  static clear() {
    _dio = null;
  }

  // 请求，返回参数为 T
  // method：请求方法，Method.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  static Future request<T>(Method method, String path,
      [dynamic data, Map options]) async {
    try {
      //没有网络
      var connectivityResult = await (new Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        _onError(ExceptionHandle.net_error, '网络异常，请检查你的网络！');
        return;
      }
      Dio _dio = createInstance();

      var defaultOptions = Options(
        method: MethodValues[method],
        sendTimeout: (options != null && options['sendTimeout'])
            ? options['sendTimeout']
            : null,
        receiveTimeout: (options != null && options['receiveTimeout'])
            ? options['receiveTimeout']
            : null,
        extra: (options != null && options['extra']) ? options['extra'] : null,
        headers:
            (options != null && options['headers']) ? options['headers'] : null,
        responseType: (options != null && options['responseType'])
            ? options['responseType']
            : null,
        contentType: (options != null && options['contentType'])
            ? options['contentType']
            : null,
        validateStatus: (options != null && options['validateStatus'])
            ? options['validateStatus']
            : null,
        receiveDataWhenStatusError:
            (options != null && options['receiveDataWhenStatusError'])
                ? options['receiveDataWhenStatusError']
                : null,
        followRedirects: (options != null && options['followRedirects'])
            ? options['followRedirects']
            : null,
        maxRedirects: (options != null && options['maxRedirects'])
            ? data['maxRedirects']
            : null,
        // requestEncoder: requestEncoder,
        responseDecoder: (options != null && options['responseDecoder'])
            ? options['responseDecoder']
            : null,
      );

      Response response =
          await _dio.request(path, data: data, options: defaultOptions);
      if (response != null) {
        var data = response.data;
        if (data != null && data['success'] == true) {
          return data['data'];
        } else {
          _onError(ExceptionHandle.unknown_error, data['message']);
        }
      } else {
        _onError(ExceptionHandle.unknown_error, '未知错误');
      }
    } on DioError catch (e) {
      // LogUtils.print_('请求出错：' + e.toString());
      final NetError netError = ExceptionHandle.handleException(e);
      _onError(netError.code, netError.msg);
    }
  }
}

void _onError(int code, String msg) {
  if (code == null) {
    code = ExceptionHandle.unknown_error;
    msg = '未知异常';
  }
  // LogUtils.print_('接口请求异常： code: $code, msg: $msg');
  print('接口请求异常： code: $code, msg: $msg');
  // throw Exception('接口请求异常：code: $code, msg: $msg');
}

// Map<String, dynamic> parseData(String data) {
//   return json.decode(data) as Map<String, dynamic>;
// }

enum Method { GET, POST, DELETE, PUT, PATCH, HEAD }
//使用：MethodValues[Method.POST]
const MethodValues = {
  Method.GET: "get",
  Method.POST: "post",
  Method.DELETE: "delete",
  Method.PUT: "put",
  Method.PATCH: "patch",
  Method.HEAD: "head",
};

//错误信息类
class NetError {
  int code;
  String msg;
  NetError(this.code, this.msg);
}

//异常处理类
class ExceptionHandle {
  static const int success = 200;
  static const int success_not_content = 204;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int not_found = 404;

  static const int net_error = 1000;
  static const int parse_error = 1001;
  static const int socket_error = 1002;
  static const int http_error = 1003;
  static const int timeout_error = 1004;
  static const int cancel_error = 1005;
  static const int unknown_error = 9999;

  static NetError handleException(DioError error) {
    if (error is DioError) {
      if (error.type == DioErrorType.DEFAULT ||
          error.type == DioErrorType.RESPONSE) {
        dynamic e = error.error;
        if (e is SocketException) {
          return NetError(socket_error, '网络异常，请检查你的网络！');
        }
        if (e is HttpException) {
          return NetError(http_error, '服务器异常！');
        }
        if (e is FormatException) {
          return NetError(parse_error, '数据解析错误！');
        }
        return NetError(net_error, '网络异常，请检查你的网络！');
      } else if (error.type == DioErrorType.CONNECT_TIMEOUT ||
          error.type == DioErrorType.SEND_TIMEOUT ||
          error.type == DioErrorType.RECEIVE_TIMEOUT) {
        //  连接超时 || 请求超时 || 响应超时
        return NetError(timeout_error, '连接超时！');
      } else if (error.type == DioErrorType.CANCEL) {
        return NetError(cancel_error, '取消请求');
      } else {
        return NetError(unknown_error, '未知异常');
      }
    } else {
      return NetError(unknown_error, '未知异常');
    }
  }
}
