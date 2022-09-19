import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as lv;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as rv;
import 'package:flutter/material.dart';
import 'package:meworld/core/utils/video_call_settings.dart';

class VideoCallView extends StatefulWidget {
  const VideoCallView({Key? key, this.channelName, this.clientRole})
      : super(key: key);
  final String? channelName;
  final ClientRole? clientRole;

  @override
  State<VideoCallView> createState() => _VideoCallViewState();
}

class _VideoCallViewState extends State<VideoCallView> {
  late RtcEngine _engine;
  final _users = <int>[];
  final _infoStrings = <String>[];
  bool _muted = false;
  bool _viewPanel = false;
  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  void dispose() {
    _users.clear();
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }

  Future initialize() async {
    if (appId.isEmpty) {
      setState(() {
        _infoStrings.add('APP ID Missing');
      });
      return;
    }
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(widget.clientRole!);

    await addEventHandler();
    VideoEncoderConfiguration config = VideoEncoderConfiguration();
    config.dimensions = const VideoDimensions(width: 1920, height: 1080);
    await _engine.setVideoEncoderConfiguration(config);
    await _engine.joinChannel(token, widget.channelName!, null, 0);
  }

  addEventHandler() async {
    _engine.setEventHandler(RtcEngineEventHandler(error: (code) {
      setState(() {
        var info = 'Error $code';
        _infoStrings.add(info);
      });
    }, joinChannelSuccess: (st, a, e) {
      var info = 'Join Chanlnel: $st, $a, $e';
      _infoStrings.add(info);
    }, userJoined: (st, str) {
      setState(() {
        _infoStrings.add('Joined $st $str');
      });
    }, userOffline: (id, reason) {
      _infoStrings.add('offline: $id, with reason: $reason');
      _users.remove(id);
    }, firstRemoteVideoFrame: (id, width, height, time) {
      _infoStrings.add('remote frame: $id, $time');
    }));
  }

  Widget viewCameras() {
    var list = <Widget>[];
    if (widget.clientRole == ClientRole.Broadcaster) {
      list.add(const lv.SurfaceView());
    }

    for (var user in _users) {
      list.add(rv.SurfaceView(uid: user, channelId: widget.channelName!));
    }
    return Column(
      children:
          List.generate(list.length, (index) => Expanded(child: list[index])),
    );
  }

  Widget toolBar() {
    if (widget.clientRole == ClientRole.Audience) return const SizedBox();
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _muted = !_muted;
                  });
                  _engine.muteLocalAudioStream(_muted);
                },
                icon: const Icon(Icons.mic)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.call_end,
                  color: Colors.red,
                )),
            IconButton(
                onPressed: () async {
                  await _engine.switchCamera();
                },
                icon: const Icon(Icons.camera))
          ],
        ),
      ),
    );
  }

  Widget panel() {
    return Visibility(
        visible: _viewPanel,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            heightFactor: .5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 48.0),
              child: ListView.builder(
                itemCount: _infoStrings.length,
                itemBuilder: (context, index) {
                  if (_infoStrings.isEmpty) return const Text("null");
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 4),
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      _infoStrings[index],
                                      style: const TextStyle(
                                          color: Colors.blueGrey),
                                    ))))
                      ],
                    ),
                  );
                },
                reverse: true,
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _viewPanel = !_viewPanel;
                });
              },
              icon: const Icon(Icons.info))
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
          child: Stack(
        children: [viewCameras(), panel(), toolBar()],
      )),
    );
  }
}
