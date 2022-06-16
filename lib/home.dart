import 'package:allvideodownloader/youtubevideo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => HomeAppState();
}

class HomeAppState extends State<HomeApp> {
  // form key
  final _formKey = GlobalKey<FormState>();
  final TextEditingController urlcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Video Downloader'),
        ), //AppBar
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 200,
                width: 335,
                child: Image.asset(
                  'assets/pichome.png',
                  height: 250,
                  width: 250,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Enter Link to Download",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: 335,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: TextFormField(
                    key: _formKey,
                    autofocus: false,
                    controller: urlcontroller,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Your Link");
                      }
                    },
                    onSaved: (value) {
                      urlcontroller.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Paste Linkl",
                    )),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: const [
                    Text(
                      "Example:",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "https://youtu.be/c7HSY8HF_3U",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                  height: 50,
                  width: 335,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  // padding: const EdgeInsets.all(32),
                  child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Download",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      if (urlcontroller.text != "") {
                        Navigator.pushAndRemoveUntil(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => YoutubeDownloadVideo(
                                      url: urlcontroller.text,
                                    )),
                            (route) => true);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Enter any Link",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Platform Supported For",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const Text(
                "Video Downloading",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/youtube.png',
                height: 50,
                width: 50,
              ),
            ],
          ),
        )),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
