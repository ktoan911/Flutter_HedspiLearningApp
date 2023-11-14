import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hedspi_learningapp/Component/constant.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  static String routeName = '/dictionary';

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  double progress = 0.0;
  late InAppWebViewController webView;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title:
            Text('Dictionary', style: Theme.of(context).textTheme.bodyMedium),
        centerTitle: true,
      ),
      body: Stack(children: [
        InAppWebView(
          initialUrlRequest:
              URLRequest(url: Uri.parse('https://mazii.net/vi-VN')),
          onWebViewCreated: (InAppWebViewController controller) {
            webView = controller;
          },
          onProgressChanged: (InAppWebViewController controller, int progress) {
            setState(() {
              this.progress = progress / 100;
            });
          },
        ),
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
