// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:palli_application/core/models/menu_modal.dart';
import 'package:palli_application/core/responsive.dart';

class Menu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Menu({super.key, required this.scaffoldKey});

  @override
  _MenuState createState() => _MenuState();
}

//menu page widgets..
class _MenuState extends State<Menu> {
  List<MenuModel> menu = [
    MenuModel(icon: 'assets/svg/home.svg', title: "Dashboard"),

    //I just remove some stuff in this code that I think it will not needed soon.
    //MenuModel(icon: 'svg/share-2.svg', title: "Connect"),
    MenuModel(icon: 'assets/svg/bell.svg', title: "Notification"),

    MenuModel(icon: 'assets/svg/profile.svg', title: "Profile"),

    MenuModel(icon: 'assets/svg/signout.svg', title: "Exit"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.grey[800]!,
              width: 1,
            ),
          ),
          color: const Color(0xFF171821)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: Responsive.isMobile(context) ? 40 : 80,
            ),
            for (var i = 0; i < menu.length; i++)
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                  color: _calculateSelectedIndex(context) == i
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                ),
                child: InkWell(
                  onTap: () {
                    widget.scaffoldKey.currentState!.closeDrawer();

                    // Navigate to the corresponding page
                    switch (i) {
                      case 0: // Dashboard
                        GoRouter.of(context).go('/dashboard');
                        break;
                      case 1: // Controller
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //       builder: (context) => const ControllerPage()),
                        // );
                        break;
                      // Add similar cases for other menu items
                      case 2: //Notification
                        GoRouter.of(context).go('/users');
                        break;
                      case 3: //History
                        GoRouter.of(context).go('/auth');
                        break;
                    }
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 7),
                        child: SvgPicture.asset(
                          menu[i].icon,
                          color: _calculateSelectedIndex(context) == i
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                      Text(
                        menu[i].title,
                        style: TextStyle(
                            fontSize: 16,
                            color: _calculateSelectedIndex(context) == i
                                ? Colors.black
                                : Colors.grey,
                            fontWeight: _calculateSelectedIndex(context) == i
                                ? FontWeight.w600
                                : FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ),
          ],
        )),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/dashboard')) {
      return 0;
    }
    if (location.startsWith('/users')) {
      return 2;
    }
    if (location.startsWith('/auth')) {
      return 3;
    }
    return 0;
  }
}
//components should works well in different platforms.
//add connection to firebase.
//Merry Christmas
