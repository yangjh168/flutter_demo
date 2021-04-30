import 'package:dio/dio.dart';
import '../dio/http_utils.dart';

CommonApi commonApi = new CommonApi();

class CommonApi {
  // 获取推荐歌单
  Future getRecommendPlaylist([Map data, Options options, bool capture]) async {
    return HttpUtils.get('/personalized', data, options, capture);
  }

  // 获取推荐的新歌（10首）
  Future getNewMusicList([Map data, Options options, bool capture]) async {
    return HttpUtils.get('/personalized/newsong', data, options, capture);
  }
}
