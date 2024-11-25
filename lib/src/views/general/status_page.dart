import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/src/components/scaffold.dart';
import 'package:satu_untuk_rakyat/src/components/status_card.dart';
import 'package:satu_untuk_rakyat/src/data/sevices_data.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SuratScaffold(
      useDrawer: false,
      useNavigationBar: false,
      body: Column(
        children: [
          ...servicesData.map((service) {
            return Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: StatusCard(service: service),
            );
          }),
        ],
      ),
    );
  }
}
