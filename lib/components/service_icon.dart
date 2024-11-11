import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/utils/colors.dart';

class ServiceIcon extends StatelessWidget {
  final String service;
  final String icon;

  const ServiceIcon({super.key, required this.service, required this.icon});

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
          child: Ink.image(
            image: AssetImage("assets/icons/$icon.png"),
            width: 30,
            height: 30,
          ),
          onPressed: () {
            return;
          },
        ),
        SizedBox(height: 5),
        Text(service),
      ],
    );
  }
}
