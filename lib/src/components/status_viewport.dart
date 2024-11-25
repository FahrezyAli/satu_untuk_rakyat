import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/src/models/services_model.dart';
import 'package:satu_untuk_rakyat/src/utils/colors.dart';

class StatusViewport extends StatelessWidget {
  final List<Services> services;

  const StatusViewport({super.key, required this.services});

  Color statusColor(String status) {
    if (status == "Success") {
      return Colors.green;
    } else if (status == "Pending") {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: suratBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          ...services.map((service) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Text(
                    service.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: statusColor(service.status),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
