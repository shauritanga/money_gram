import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_gram/constants/color.dart';
import 'package:money_gram/screens/register.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColor.white,
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16, top: kToolbarHeight, right: 16, bottom: kToolbarHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("MoneyGram",
                style: GoogleFonts.inconsolata(
                  color: MyAppColor.primary,
                  fontSize: 34.0,
                  shadows: [
                    Shadow(
                      offset: const Offset(3, 3),
                      color: MyAppColor.muted,
                      blurRadius: 6.0,
                    ),
                  ],
                )),
            const Text(
              "Transfer your Money Quickly and securely",
              style: TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.w200,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const RegistrationScreen(),
                        ),
                      );
                    },
                    height: 48,
                    color: MyAppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: MyAppColor.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const RegistrationScreen(),
                        ),
                      );
                    },
                    height: 48,
                    color: MyAppColor.light,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: MyAppColor.primary,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: MyAppColor.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
