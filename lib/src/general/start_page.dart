import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:satu_untuk_rakyat/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(),
          SizedBox(height: 75),
          Image.asset(
            'assets/images/logo.png',
            width: 250,
          ),
          SizedBox(height: 250),
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
              width: 250,
              child: const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
              width: 250,
              child: const Center(
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          RichText(
            text: TextSpan(
              text: AppLocalizations.of(context)!.skip,
              style: const TextStyle(
                color: suratBlue,
                fontFamily: "Roboto",
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacementNamed(context, "/landing");
                },
            ),
          ),
        ],
      ),
    );
  }
}
