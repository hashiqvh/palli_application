import 'package:flutter/material.dart';
import 'package:palli_application/core/responsive.dart';
import 'package:palli_application/main.dart';
import 'package:palli_application/presentation/home/components/header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(
          Responsive.isMobile(context) ? 15 : 20,
        ),
        child: Column(
          children: [
            SizedBox(
              height: Responsive.isMobile(context) ? 5 : 18,
            ),
            Header(scaffoldKey: scaffoldKey),
          ],
        ),
      ),
    );
  }
}
