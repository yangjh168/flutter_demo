import 'package:cloud_music/api/netease.dart';
import 'package:cloud_music/entity/music.dart';
import 'package:cloud_music/entity/playlist_detail.dart';
import 'package:cloud_music/provider/player_store.dart';
import 'package:cloud_music/widget/load_data_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_music/widget/platform_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SonglistPage extends StatelessWidget {
  //参数
  final int id;

  const SonglistPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: LoadDataBuilder<PlaylistDetail>(
              api: neteaseApi.getSonglistDetail,
              params: {'id': id},
              builder: (context, data) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverCustomHeaderDelegate(
                        title: data.name,
                        collapsedHeight: 40,
                        expandedHeight: 300,
                        paddingTop: MediaQuery.of(context).padding.top,
                        playlistDetail: data,
                      ),
                    ),
                    SliverFillRemaining(
                      child: SongListBuild(songList: data.musicList),
                    )
                  ],
                );
              })),
    );
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final PlaylistDetail playlistDetail;
  final String title;
  String statusBarMode = 'dark';

  SliverCustomHeaderDelegate({
    this.collapsedHeight,
    this.expandedHeight,
    this.paddingTop,
    this.playlistDetail,
    this.title,
  });

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  void updateStatusBarBrightness(shrinkOffset) {
    if (shrinkOffset > 50 && this.statusBarMode == 'dark') {
      this.statusBarMode = 'light';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));
    } else if (shrinkOffset <= 50 && this.statusBarMode == 'light') {
      this.statusBarMode = 'dark';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    this.updateStatusBarBrightness(shrinkOffset);
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SongListInfo(headInfo: playlistDetail),
          Positioned(
            left: 0,
            top: this.maxExtent / 2,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00000000),
                    Color(0x90000000),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: this.makeStickyHeaderBgColor(shrinkOffset),
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: this.collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: this
                              .makeStickyHeaderTextColor(shrinkOffset, true),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Expanded(
                        child: Text(
                          this.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: this
                                .makeStickyHeaderTextColor(shrinkOffset, false),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: this
                              .makeStickyHeaderTextColor(shrinkOffset, true),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SongListInfo extends StatelessWidget {
  final PlaylistDetail headInfo;

  const SongListInfo({Key key, this.headInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.network(headInfo.coverUrl, fit: BoxFit.cover));
  }
}

//歌曲列表
class SongListBuild extends StatelessWidget {
  final List songList;

  const SongListBuild({Key key, this.songList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        // margin: EdgeInsets.all(20.0.w),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Colors.white),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 0.5, color: Color(0xFFf5f5f5)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('单曲', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Wrap(
              children: songList.map((item) {
                return _playItem(item, context);
              }).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget _playItem(item, context) {
    return InkWell(
      onTap: () async {
        //点击音乐
        var playable = await neteaseApi
            .checkMusic({'id': item.id, 'platform': item.platform});
        if (!playable) {
          print("音乐不可用");
          // showDialog(context: context, builder: (context) => DialogNoCopyRight());
          return;
        }

        final res = await neteaseApi
            .getMusicDetail({'id': item.id, 'platform': item.platform});
        Music music = Music.fromMap(res);
        PlayerStore player = PlayerStore.of(context, listen: false);
        if (player.music == null || player.music.id != music.id) {
          player.play(music: music, playList: []);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xFFf5f5f5)))),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${item.title}',
                        style: TextStyle(
                            color: Color(0XFF666666), fontSize: 24.0.sp)),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: PlatformLogo(platform: item.platform),
                        ),
                        Expanded(
                          child: Text(
                            '${item.subTitle}',
                            style: TextStyle(
                                color: Color(0XFF666666), fontSize: 24.0.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Icon(Icons.play_circle_outline),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Icon(Icons.more_vert_outlined),
            )
          ],
        ),
      ),
    );
  }
}
