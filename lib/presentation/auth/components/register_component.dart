import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palli_application/core/themes/color_themes.dart';
import 'package:palli_application/presentation/common/components/field_component.dart';

class RegisterComponent extends StatelessWidget {
  final BoxConstraints constraints;
  final double size;
  const RegisterComponent(
      {super.key, required this.size, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const FieldComponent(
          labelText: "Full Name",
        ),
        SizedBox(
          height: size * 0.03,
        ),
        const FieldComponent(
          labelText: "Email Address",
        ),
        SizedBox(
          height: size * 0.03,
        ),
        const FieldComponent(
          labelText: "Phone Number",
        ),
        SizedBox(
          height: size * 0.03,
        ),
        const FieldComponent(
          labelText: "Password",
        ),
        SizedBox(
          height: size * 0.03,
        ),
        const FieldComponent(
          labelText: "Confirm Password",
        ),
        SizedBox(
          height: size * 0.05,
        ),
        GestureDetector(
          onTap: () => GoRouter.of(context).go('/dashboard'),
          child: Container(
            width: constraints.maxWidth,
            height: 48.25,
            decoration: ShapeDecoration(
              color: blueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 5,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const Center(
              child: Text(
                'Continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0.12,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
