import 'package:flutter/material.dart';
import 'package:mangwa/controller/screen_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DesktopHome extends StatelessWidget {
  const DesktopHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}