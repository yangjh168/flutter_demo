import 'package:dio/dio.dart';
import '../dio/http_utils.dart';

NeteaseApi neteaseApi = new NeteaseApi();

class NeteaseApi {
  // 获取首页轮播图数据
  Future getHomePageSwiper([data, options]) async {
    return HttpUtils.get(
        'https://www.heytap.com/cn/oapi/configs/web/banners/040101,040201',
        data,
        options);
  }

  // 获取推荐的新歌（10首）
  Future getNewMusicList([Map data, Options options, bool capture]) async {
    return HttpUtils.get('/personalized/newsong', data, options, capture);
  }

  ///根据音乐id获取歌词
  Future loadLyric([Map data, Options options, bool capture]) async {
    return HttpUtils.get('/lyric', data, options, capture);
  }

  //获取热门搜索列表
  Future getHotSearchList([Map data, Options options, bool capture]) async {
    return HttpUtils.get('/search/hot', data, options, capture);
  }

  //获取搜索结果列表
  Future getSearchResultList([Map data, Options options, bool capture]) async {
    return HttpUtils.get('/search', data, options, capture);
  }

  //检查音乐是否可用
  Future checkMusic([Map data, Options options, bool capture]) async {
    return HttpUtils.get('/check/music', data, options, capture);
  }

  //获取歌曲详情
  Future getMusicDetail([Map data, Options options, bool capture]) async {
    return HttpUtils.get('/song/detail', data, options, capture);
  }
}
