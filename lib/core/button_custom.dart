import 'package:flutter/material.dart';

import 'color_app.dart';

class ButtonCustom extends StatelessWidget{
  String text;
  VoidCallback onTap;
  ButtonCustom({super.key, required this.text,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 33.0, left: 16, right: 16),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorApp.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ColorApp.white,
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_forward, color: ColorApp.white),
            ],
          ),
        ),
      ),
    );
  }
}