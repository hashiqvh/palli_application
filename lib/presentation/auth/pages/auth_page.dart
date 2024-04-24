import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palli_application/core/responsive.dart';
import 'package:palli_application/core/themes/color_themes.dart';
import 'package:palli_application/presentation/auth/components/login_component.dart';
import 'package:palli_application/presentation/auth/components/register_component.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool isScrenLarge = constraints.maxWidth > 600;
          double size = constraints.maxWidth > 600
              ? constraints.maxHeight
              : constraints.maxWidth - 150;
          return Row(
            children: [
              if (constraints.maxWidth > 800)
                Expanded(
                    child: Container(
                  color: lightGreenColor,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: SvgPicture.asset(
                    "assets/images/mosque.svg",
                  ),
                )),
              Expanded(
                  child: Container(
                color: const Color(0xFF171821),
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size * 0.2,
                    right: size * 0.2,
                    top: isLogin ? size * 0.2 : size * 0.1,
                    bottom: isLogin ? size * 0.2 : size * 0.1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      !isScrenLarge
                          ? Center(
                              child: SvgPicture.asset(
                                "assets/images/mosque.svg",
                                height: size * 0.5,
                              ),
                            )
                          : const SizedBox(),
                      Text(
                        isLogin ? 'Login' : "Signup",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: Responsive.isDesktop(context)
                            ? constraints.maxHeight * 0.01
                            : constraints.maxHeight * 0.01,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: isLogin
                            ? Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Don't have an account?  ",
                                      style: TextStyle(
                                        color: Color(0xFF6C737F),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Register',
                                      style: TextStyle(
                                        color: blueColor,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Already have an account ?  ",
                                      style: TextStyle(
                                        color: Color(0xFF6C737F),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Login',
                                      style: TextStyle(
                                        color: blueColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                      SizedBox(
                        height: Responsive.isDesktop(context)
                            ? constraints.maxHeight * 0.02
                            : constraints.maxHeight * 0.02,
                      ),
                      isLogin
                          ? LoginComponent(
                              size: size,
                              constraints: constraints,
                            )
                          : RegisterComponent(
                              size: size, constraints: constraints)
                    ],
                  ),
                ),
              )),
            ],
          );
        },
      ),
    );
  }
}
