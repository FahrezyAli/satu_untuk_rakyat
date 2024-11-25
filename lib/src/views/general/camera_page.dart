import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/src/components/scaffold.dart';
import 'package:satu_untuk_rakyat/src/utils/colors.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SuratScaffold(
      useDrawer: false,
      useNavigationBar: false,
      body: Column(
        children: [
          Expanded(
            child: Image.asset("assets/images/ktp_placeholder.png"),
          ),
          Container(
            color: suratBlue,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    backgroundColor: suratGray,
                    foregroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    return;
                  },
                  child: const Icon(
                    Icons.flash_on_outlined,
                    size: 30,
                    color: Colors.black54,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    backgroundColor: suratGray,
                    foregroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    return;
                  },
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    size: 40,
                    color: Colors.black54,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    backgroundColor: suratGray,
                    foregroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    return;
                  },
                  child: const Icon(
                    Icons.image_outlined,
                    size: 30,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
