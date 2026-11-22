import 'package:flutter/material.dart';

import 'color_app.dart';

class ArrowButton extends StatelessWidget {
  IconData icon;
  VoidCallback onTap;
  ArrowButton({super.key, required this.icon,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: CircleBorder(),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: ColorApp.red,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: ColorApp.white),
      ),
    );
  }
}