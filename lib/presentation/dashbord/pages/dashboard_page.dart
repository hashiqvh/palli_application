import 'package:flutter/material.dart';
import 'package:palli_application/core/responsive.dart';
import 'package:palli_application/presentation/dashbord/components/menu.dart';

class DashBoardPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final Widget child;

  DashBoardPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: !Responsive.isDesktop(context)
          ? SizedBox(width: 250, child: Menu(scaffoldKey: _scaffoldKey))
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Menu(scaffoldKey: _scaffoldKey),
                ),
              ),
            Expanded(flex: 8, child: child),
          ],
        ),
      ),
    );
  }
}
