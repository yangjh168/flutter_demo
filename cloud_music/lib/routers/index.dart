import 'package:cloud_music/music_player/player_page.dart';
import 'package:cloud_music/pages/layout/player_router_view.dart';
import 'package:cloud_music/pages/layout/slide_drawer.dart';
import 'package:cloud_music/pages/search_page.dart';
import 'package:cloud_music/pages/songlist_page.dart';

final Map<String, Function> routers = {
  '/slideDrawer': (params) => SlideDrawer(),
  '/playerView': (params) => PlayerRouterView(),
  // '/player': (params) => PlayingPage(),
  '/playerPage': (params) => PlayerPage(),
  '/searchPage': (params) => SearchPage(),
  '/songlistPage': (params) => SonglistPage(id: int.parse(params['id'])),
};

final Map<String, Object> routes = {
  '/slideDrawer': (params) => SlideDrawer(),
  '/player': {
    '/player/start': (params) => PlayerRouterView(),
  }
};
