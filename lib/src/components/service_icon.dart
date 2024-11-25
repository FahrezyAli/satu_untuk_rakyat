import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/src/utils/colors.dart';

class ServiceIcon extends StatelessWidget {
  final String service;
  final String icon;
  final VoidCallback? onPressed;

  const ServiceIcon({
    super.key,
    required this.service,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(10),
            backgroundColor: suratGray,
            foregroundColor: Colors.blue,
          ),
          onPressed: onPressed,
          child: Ink.image(
            image: AssetImage("assets/icons/$icon.png"),
            width: 30,
            height: 30,
          ),
        ),
        SizedBox(height: 5),
        Text(service),
      ],
    );
  }
}
