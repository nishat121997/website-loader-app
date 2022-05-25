import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:website_loader_app/widgets/drawer.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  late WebViewController controller;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: const Text('Starbucks Web View'),
      ),
      resizeToAvoidBottomInset: false,
      drawer: MyDrawer(),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://www.starbucks.com/',
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
      ),
    );
  }
}
