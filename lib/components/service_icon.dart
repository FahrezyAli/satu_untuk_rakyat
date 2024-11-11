import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/utils/colors.dart';

class ServiceIcon extends StatelessWidget {
  final String service;

  const ServiceIcon({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50),
          child: Ink(
            decoration: BoxDecoration(
              color: suratGray,
              borderRadius: BorderRadius.circular(50),
            ),
            width: 50,
            height: 50,
            child: Image.asset("assets/images/${service.toLowerCase()}.png"),
          ),
          onTap: () {
            return;
          },
        ),
        SizedBox(height: 10),
        Text(service),
      ],
    );
  }
}
