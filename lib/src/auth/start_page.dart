import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Column(
        children: [
          const Center(),
          SizedBox(height: deviceWidth / 5),
          Image(
            image: const AssetImage('assets/images/logo.png'),
            width: deviceWidth - 100,
          ),
          SizedBox(height: deviceWidth - 150),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              return;
            },
            child: SizedBox(
              width: deviceWidth - 100,
              child: const Center(
                child: Text('Login'),
              ),
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: suratBlue,
              backgroundColor: Colors.white,
              side: const BorderSide(color: suratBlue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              return;
            },
            child: SizedBox(
              width: deviceWidth - 100,
              child: const Center(
                child: Text('Register'),
              ),
            ),
          ),
          const SizedBox(height: 15),
          RichText(
            text: TextSpan(
              text: AppLocalizations.of(context)!.skip,
              style: const TextStyle(color: suratBlue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  return;
                },
            ),
          ),
        ],
      ),
    );
  }
}
