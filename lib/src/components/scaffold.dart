import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/src/components/drawer.dart';
import 'package:satu_untuk_rakyat/src/components/navigation_bar.dart';

class SuratScaffold extends StatelessWidget {
  final String? title;
  final bool useDrawer;
  final bool useNavigationBar;
  final Widget? body;

  const SuratScaffold({
    super.key,
    this.title,
    this.useDrawer = true,
    this.useNavigationBar = true,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: useDrawer ? SuratDrawer() : null,
      appBar: AppBar(
        title: Text(title ?? "Surat"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              return;
            },
          ),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: const AssetImage(
              'assets/images/user.png',
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              splashColor: Colors.blue,
              onTap: () {
                return;
              },
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      bottomNavigationBar: useNavigationBar ? SuratNavigationBar() : null,
      body: body,
    );
  }
}
