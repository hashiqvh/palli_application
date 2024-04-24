import 'package:flutter/material.dart';
import 'package:palli_application/core/responsive.dart';
import 'package:palli_application/presentation/home/components/header_widget.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Responsive.isMobile(context) ? 5 : 18,
          ),
          Header(scaffoldKey: _scaffoldKey),
        ],
      ),
    );
  }
}
