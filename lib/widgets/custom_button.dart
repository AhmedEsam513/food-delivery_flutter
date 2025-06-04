import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onTap;
  final Widget icon;

  const CustomButton({super.key,
    required this.height,
    required this.width,
    required this.onTap,
    required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.grey[200]
      ),
      child: InkWell(onTap: onTap, child: icon),
    );
  }
}
