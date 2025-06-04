import 'package:flutter/material.dart';

class PropertWidget extends StatelessWidget {
  final String propertyName;
  final String propertyValue;

  const PropertWidget({super.key, required this.propertyName, required this.propertyValue});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Column(
      children: [
        Text(propertyName,
          style: themeData.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w900, color: Colors.deepOrange),
        ),
        SizedBox(height: 7,),
        Text(propertyValue,
          style: themeData.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
