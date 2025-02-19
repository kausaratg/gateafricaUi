import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/forgotpassword_screen.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';
import 'package:gateafricapp/screens/onboarding_screen2.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool isButtonEnable = false;
  String userid = "";
  TextEditingController idController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    idController.addListener(updateButtonState);
    pinController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnable =
          idController.text.isNotEmpty && pinController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              headertext: GateafricaTexts.welcome,
              smalltext: GateafricaTexts.hello,
              route: OnboardingScreen2(),
            ),
            TextForm(
              labeltexts: GateafricaTexts.tokenid,
              placeholder: GateafricaTexts.tokenidplaceholder,
              idController: idController,
            ),
            PasswordForm(
              labeltexts: GateafricaTexts.tokenpin,
              placeholder: GateafricaTexts.tokenpinplaceholder,
              pinController: pinController,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotpasswordScreen(),
                    ),
                  );
                },
                child: Text(
                  GateafricaTexts.forgot,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: greencolor,
                  ),
                ),
              ),
            ),
            Spacer(),
            Button(
              texts: GateafricaTexts.login,
              route: ForgotpasswordScreen(),
              background: isButtonEnable ? greencolor : buttoncolor,
            ),
            SizedBox(height: 4),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: GateafricaTexts.account,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: greycolor,
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          GateafricaTexts.register,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: greencolor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
