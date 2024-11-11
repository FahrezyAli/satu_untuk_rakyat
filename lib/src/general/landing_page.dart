import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/components/drawer.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SuratDrawer(),
      appBar: AppBar(
        title: Text(
          "SURAT",
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              return;
            },
          ),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              child: Ink.image(
                image: const AssetImage('assets/images/user_placeholder.png'),
              ),
              onTap: () {
                return;
              },
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
