import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tugas1/screens/signin.dart';
import 'package:tugas1/screens/signup.dart';
import 'package:tugas1/theme/theme.dart';
import 'package:tugas1/widgets/custom_scaffold.dart';
import 'package:tugas1/widgets/welcome_button.dart';

class WelcomeScreen extends  StatelessWidget {
  const WelcomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      Child: Column(
        children: [
          Flexible(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 40.0,
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Selamat Datang!\n',
                        style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70,
                        )),
                      TextSpan(
                        text: '\nMasukan detail Pribadi ke akun Anda',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        )),
                    ],
                  ),
                ),
              ),
            )),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                    child: WelcomeButoon(
                      buttonText: 'Masuk',
                      onTap: SignInScreen(),
                      color: Colors.white70,
                      textColor: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButoon(
                      buttonText: 'Mendaftar',
                      onTap: const SignUpScreen(),
                      color: Colors.white70,
                      textColor: lightColorScheme.primary,
                    ),
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}