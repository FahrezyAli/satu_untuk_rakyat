import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/components/reminder_card.dart';
import 'package:satu_untuk_rakyat/components/scaffold.dart';
import 'package:satu_untuk_rakyat/components/service_icon.dart';
import 'package:satu_untuk_rakyat/components/status_viewport.dart';
import 'package:satu_untuk_rakyat/data/reminder_data.dart';
import 'package:satu_untuk_rakyat/data/sevices_data.dart';

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
            SizedBox(height: 5),
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
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ServiceIcon(
                    service: "SIM",
                    icon: "sim",
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Buat Baru"),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(bottom: 10),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                      context,
                                      '/sim-extension-form',
                                    );
                                  },
                                  child: Text("Perpanjang"),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }),
                ServiceIcon(
                  service: "Paspor",
                  icon: "pasport",
                ),
                ServiceIcon(
                    service: "Surat Sehat",
                    icon: "health",
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                      context,
                                      '/health-form',
                                    );
                                  },
                                  child: Text("Buat Baru"),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(bottom: 10),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Histori"),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }),
                ServiceIcon(
                  service: "Histori",
                  icon: "history",
                  onPressed: () {
                    Navigator.pushNamed(context, '/status');
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ServiceIcon(
                  service: "KTP",
                  icon: "ktp",
                ),
                ServiceIcon(
                  service: "KK",
                  icon: "kk",
                ),
                ServiceIcon(
                  service: "Akta",
                  icon: "akta",
                ),
                ServiceIcon(
                  service: "Lainnya",
                  icon: "other",
                ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              "Status",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            StatusViewport(services: servicesData),
          ],
        ),
      ),
    );
  }
}
