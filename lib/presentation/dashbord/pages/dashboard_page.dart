import 'package:flutter/material.dart';
import 'package:palli_application/core/responsive.dart';
import 'package:palli_application/main.dart';
import 'package:palli_application/presentation/dashbord/components/menu.dart';

class DashBoardPage extends StatelessWidget {
  final Widget child;

  const DashBoardPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: !Responsive.isDesktop(context)
          ? SizedBox(width: 250, child: Menu(scaffoldKey: scaffoldKey))
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Menu(scaffoldKey: scaffoldKey),
                ),
              ),
            Expanded(flex: 8, child: child),
          ],
        ),
      ),
    );
  }
}
