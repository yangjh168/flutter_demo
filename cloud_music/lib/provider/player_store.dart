import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_music/entity/music.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerStore extends ChangeNotifier {
  // 根据BuildContext获取 [PlayerStore]
  static PlayerStore of(BuildContext context, {bool listen = true}) {
    return Provider.of<PlayerStore>(context, listen: listen);
  }

  // 播放器
  final AudioPlayer audioPlayer = new AudioPlayer();
  // 当前播放音乐
  Music music;
  // 当前播放状态
  AudioPlayerState status = AudioPlayerState.STOPPED;
  // 当前播放时间
  Duration duration;
  // 音频的当前位置
  Duration position;
  // 播放队列
  List<Music> playList;

  /// 音量
  final double volume = 1.0;

  /// 是否是本地资源
  final bool isLocal = false;
  // 当前是否播放状态
  bool get isPlaying => (status == AudioPlayerState.PLAYING);

  // 构造函数
  PlayerStore() {
    this.initAudioPlayer();
  }
  // 初始化播放器的监听事件
  void initAudioPlayer() {
    audioPlayer
      //音频播放完毕事件
      // ..onPlayerCompletion.listen((void s) {
      //   // completedEvents.forEach((fn) => fn());
      //   notifyListeners();
      // })
      // 改变状态事件
      ..onPlayerStateChanged.listen((AudioPlayerState state) {
        print("播放器状态改变");
        this.status = state;
        notifyListeners();
        // statusChangedEvents.forEach((fn) => fn(state));
      })
      // 播放错误事件
      ..onPlayerError.listen((String e) {
        notifyListeners();
        // errorEvents.forEach((fn) => fn(e));
      })
      //持续时间事件
      ..onDurationChanged.listen((value) {
        this.duration = value;
        notifyListeners();
        // durationChangedEvents.forEach((fn) => fn(duration));
      })
      //更新音频的当前位置事件
      ..onAudioPositionChanged.listen((value) {
        this.position = value;
        notifyListeners();
        // audioPositionChangedEvents.forEach((fn) => fn(position));
      });
    //初始化完audioPlayer，触发更新
    notifyListeners();
  }

  //播放
  play({Music music, List<Music> playList}) {
    print("播放音乐");
    print(music);
    if (playList != null) {
      this.playList = playList;
    }
    if (music != null) {
      this.music = music;
    }
    Music _music = this.music;
    audioPlayer.play(
      _music.url,
      isLocal: isLocal,
      volume: volume,
    );
  }

  //暂停
  pause() {
    audioPlayer.pause();
  }

  //继续播放
  resume() {
    audioPlayer.resume();
  }

  // 跳过音频
  seek(Duration d) {
    audioPlayer.seek(d);
  }

  //处理播放、暂停按钮事件
  playHandle() {
    if ((status == AudioPlayerState.STOPPED ||
            status == AudioPlayerState.COMPLETED) &&
        music != null) {
      play();
    } else if (status == AudioPlayerState.PLAYING) {
      pause();
    } else if (status == AudioPlayerState.PAUSED) {
      resume();
    }
  }

  //处理上一首按钮事件
  previous() {
    if (playList == null) {
      return;
    }
    int index = playList.indexOf(music);
    if (index == -1) {
      return;
    }
    int i = index - 1;
    if (i < 0) {
      i = playList.length - 1;
    }
    play(music: playList[i]);
  }

  //处理下一首按钮事件
  next() {
    if (playList == null) {
      return;
    }
    int index = playList.indexOf(music);
    if (index == -1) {
      return;
    }
    int i = index + 1;
    if (i >= playList.length) {
      i = 0;
    }
    play(music: playList[i]);
  }
  // Music currentMusic;
  // setCurrentMusic(Music music) {
  //   currentMusic = music;
  //   notifyListeners();
  // }
}
