import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';

class YoutubeDownloadVideo extends StatefulWidget {
  String url;
  YoutubeDownloadVideo({Key? key, required this.url}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<YoutubeDownloadVideo> {
  String _extractedLink = 'Loading...';

  String youTube_link = "";
  String ext = ".";

  @override
  void initState() {
    super.initState();
    setState(() {
      youTube_link = widget.url;
    });
    extractYoutubeLink();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> extractYoutubeLink() async {
    String link;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      link =
          await FlutterYoutubeDownloader.extractYoutubeLink(youTube_link, 18);
    } on PlatformException {
      link = 'Failed to Extract YouTube Video Link.';
    }

    if (!mounted) return;
    setState(() {
      _extractedLink = link;
    });
  }

  Future<void> downloadVideo() async {
    final result = await FlutterYoutubeDownloader.downloadVideo(
        youTube_link, "Hadi's Download ${ext}", 18);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(' Youtube Link Downloader'),
        ),
        body: Center(
          child: Text('Extracted Link : $_extractedLink\n'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: downloadVideo,
          child: const Icon(Icons.download_rounded),
        ),
      ),
    );
  }
}
