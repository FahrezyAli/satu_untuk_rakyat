import 'package:flutter/material.dart';

class SuratNavigationBar extends StatefulWidget {
  const SuratNavigationBar({super.key});

  @override
  State<SuratNavigationBar> createState() => _SuratNavigationBarState();
}

class _SuratNavigationBarState extends State<SuratNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              setState(() {
                currentIndex = 0;
              });
              Navigator.pushReplacementNamed(context, "/landing");
            },
            icon: Icon(Icons.home),
          ),
          label: "Beranda",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "Tambah Dokumen",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profil",
        ),
      ],
    );
  }
}
