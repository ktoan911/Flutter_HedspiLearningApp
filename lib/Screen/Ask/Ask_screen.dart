// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hedspi_learningapp/Component/constant.dart';

class AskScreen extends StatefulWidget {
  const AskScreen({super.key});

  static String routeName = '/askscreen';

  @override
  State<AskScreen> createState() => _AskScreenState();
}

class _AskScreenState extends State<AskScreen> {
  double progress = 0.0;
  late InAppWebViewController webView;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Ask with Bard',
            style: Theme.of(context).textTheme.bodyMedium),
        centerTitle: true,
      ),
      body: Stack(children: [
        InAppWebView(
          initialUrlRequest:
              URLRequest(url: Uri.parse('https://bard.google.com/chat')),
          onWebViewCreated: (InAppWebViewController controller) {
            webView = controller;
          },
          onProgressChanged: (InAppWebViewController controller, int progress) {
            setState(() {
              this.progress = progress / 100;
            });
          },
        ),
        //check progress
        progress < 1.0
            ? SizedBox(
                height: 3.0,
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: kTextWhiteColor,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ))
            : const SizedBox(),
      ]),
    );
  }
}
