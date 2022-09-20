// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meworld/core/repository/rapyd_helper.dart';
import 'package:meworld/views/screens/video%20call/video_call_view.dart';
import 'package:permission_handler/permission_handler.dart';

class IndexVideoCall extends StatefulWidget {
  const IndexVideoCall({Key? key}) : super(key: key);

  @override
  State<IndexVideoCall> createState() => _IndexVideoCallState();
}

//command to run express js server with automatic restart: nodemon --exec npm start
//command to expose local host: lt --port 3000
class _IndexVideoCallState extends State<IndexVideoCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            onPressed: () async {
              var res = await RapydAPI().createWallet({});
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(res.toString())));
            },
            child: const Text("Test create wallet")),
        ElevatedButton(
            onPressed: () async {
              if (kIsWeb == false) {
                await Permission.camera.request();
                await Permission.microphone.request();
              } else {
                await window.navigator.getUserMedia(audio: true, video: true);
              }
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VideoCallView(
                        channelName: 'meworld',
                        clientRole: ClientRole.Broadcaster,
                      )));
            },
            child: const Text("join video call")),
      ],
    ));
  }
}
