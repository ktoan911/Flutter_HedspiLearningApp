import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hedspi_learningapp/Component/constant.dart';

class SchoolerScreen extends StatefulWidget {
  const SchoolerScreen({super.key});

  static String routeName = '/schooler';

  @override
  State<SchoolerScreen> createState() => _SchoolerScreenState();
}

class _SchoolerScreenState extends State<SchoolerScreen> {
  double progress = 0.0;
  late InAppWebViewController webView;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Schooler', style: Theme.of(context).textTheme.bodyMedium),
        centerTitle: true,
      ),
      body: Stack(children: [
        InAppWebView(
          initialUrlRequest:
              URLRequest(url: Uri.parse('https://schooler.sun-asterisk.com/')),
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
