import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/components/reminder_card.dart';
import 'package:satu_untuk_rakyat/components/scaffold.dart';
import 'package:satu_untuk_rakyat/components/service_icon.dart';
import 'package:satu_untuk_rakyat/data/reminder_data.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SuratScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            SizedBox(height: 25),
            Text(
              "Reminder",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            ...reminderData.map((reminder) {
              return ReminderCard(reminder: reminder);
            }),
            SizedBox(height: 25),
            Text(
              "Layanan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ServiceIcon(
                  service: "SIM",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
