import 'package:flutter/material.dart';
import 'package:cloud_music/widget/bottom_player_bar.dart';

class PlayerRouterView extends StatefulWidget {
  PlayerRouterView({Key key}) : super(key: key);

  @override
  _PlayerRouterViewState createState() => _PlayerRouterViewState();
}

class _PlayerRouterViewState extends State<PlayerRouterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Navigator(
              initialRoute: '/player',
              onGenerateRoute: _onGenerateRoute,
              onUnknownRoute: (val) {
                print(val);
                return null;
              },
            ),
          ),
          BottomPlayerBar()
        ],
      ),
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    if (settings.name == Navigator.defaultRouteName) {
      return MaterialPageRoute(
          settings: settings,
          builder: (context) => Container(
                child: Text('默认'),
              ));
    }
    Widget widget;
    print(settings);
    switch (settings.name) {
      case '/list':
        widget = Container(
          child: Text("list"),
        );
        break;
      case '/search':
        // return Container();
        widget = Container(
          child: Text("search"),
        );
        break;
      case '/settings':
        widget = Container(
          child: Text("settings"),
        );
        break;
      default:
        widget = Container(
          child: Text('其它'),
        );
        break;
    }
    return MaterialPageRoute(settings: settings, builder: (context) => widget);
    // assert(widget != null, "can not generate route for $settings");
    // return null;
  }
}
