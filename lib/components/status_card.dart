import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/models/services_model.dart';
import 'package:satu_untuk_rakyat/utils/colors.dart';
import 'package:intl/intl.dart';

class StatusCard extends StatelessWidget {
  final Services service;

  const StatusCard({super.key, required this.service});

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
      height: 75,
      decoration: BoxDecoration(
        color: suratBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          Container(
            height: 50,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/icons/${service.icon}.png',
              scale: 2,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Text(
                DateFormat('EEEE, dd MMMM yyyy').format(service.date),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 8,
                ),
              ),
              Text(
                service.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                DateFormat.Hm().format(service.date),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: statusColor(service.status),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ],
      ),
    );
  }
}
