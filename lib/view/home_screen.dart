import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mangwa/controller/screen_controller.dart';
import 'package:mangwa/responsive/desktop.dart';
import 'package:mangwa/responsive/responsive.dart';
import 'package:mangwa/responsive/tablet.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: MobileHome(),
      tablet: TabletHome(),
      desktop: DesktopHome(),
    );
  }
}

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  bool _isRefreshing = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: _isRefreshing
              ? Center(
                  child: Lottie.asset(
                    'assets/load.json',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                )
              : WebViewWidget(controller: controller),
        ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    setState(() {
      _isRefreshing = true;
    });
    await Future.delayed(const Duration(seconds: 2)); 
    setState(() {
      _isRefreshing = false;
    });
  }
}