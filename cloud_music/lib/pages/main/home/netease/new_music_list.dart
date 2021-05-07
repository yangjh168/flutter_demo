import 'package:cloud_music/api/common.dart';
import 'package:cloud_music/entity/model.dart';
import 'package:cloud_music/entity/music.dart';
import 'package:cloud_music/provider/player_store.dart';
import 'package:cloud_music/widget/load_data_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewMusicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 20.0.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
            color: Colors.white),
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.symmetric(vertical: 14.0.h, horizontal: 20.0.w),
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 0.5, color: Color(0xFFf5f5f5)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('最新歌曲', style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text('更多', style: TextStyle(color: Colors.black38)),
                      Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.black38, size: 24.sp)
                    ],
                  )
                ],
              ),
            ),
            LoadDataBuilder(
                api: commonApi.getNewMusicList,
                builder: (context, data) {
                  List<Music> songs = (data as List)
                      .cast<Map>()
                      .map((item) => Music.fromMap(item))
                      .toList();
                  return Container(
                      child: Column(
                    children: songs.map<Widget>((item) {
                      return _playItem(item, songs, context);
                    }).toList(),
                  ));
                })
          ],
        ));
  }

  Widget _playItem(item, List<Music> allList, context) {
    return InkWell(
      onTap: () {
        PlayerStore player = PlayerStore.of(context, listen: false);
        if (player.music == null || player.music.id != item.id) {
          player.play(music: item, playList: allList);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          children: [
            Container(
              color: Colors.yellow,
              width: 80.0.w,
              height: 80.0.w,
              margin: EdgeInsets.only(right: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(item.imageUrl),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${item.title}',
                      style: TextStyle(
                          color: Color(0XFF666666), fontSize: 24.0.sp)),
                  Text('${item.subTitle}',
                      style: TextStyle(
                          color: Color(0XFF666666), fontSize: 24.0.sp)),
                ],
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

// class MusicTile extends StatelessWidget {
//   final Music music;

//   MusicTile(this.music, {Key key}) : super(key: key);

//   Widget _buildPadding(BuildContext context, Music music) {
//     return SizedBox(width: 8);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final list = MusicTileConfiguration.of(context);
//     return Container(
//       height: 56,
//       child: InkWell(
//         onTap: () {
//           if (list.onMusicTap != null) list.onMusicTap(context, music);
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             (list.leadingBuilder ?? _buildPadding)(context, music),
//             Expanded(
//               child: _SimpleMusicTile(music),
//             ),
//             (list.trailingBuilder ?? _buildPadding)(context, music),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _SimpleMusicTile extends StatelessWidget {
//   final Music music;

//   const _SimpleMusicTile(this.music, {Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56,
//       child: Row(
//         children: <Widget>[
//           Expanded(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Spacer(),
//               Text(
//                 music.title,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: Theme.of(context).textTheme.bodyText2,
//               ),
//               Padding(padding: EdgeInsets.only(top: 3)),
//               Text(
//                 music.subTitle,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: Theme.of(context).textTheme.caption,
//               ),
//               Spacer(),
//             ],
//           )),
//         ],
//       ),
//     );
//   }
// }
