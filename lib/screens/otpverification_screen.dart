import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/forgotpassword_screen.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';
import 'package:gateafricapp/screens/tokensuccessful_screen.dart';
import 'package:pinput/pinput.dart';

class OtpverificationScreen extends StatefulWidget {
  const OtpverificationScreen({super.key});

  @override
  State<OtpverificationScreen> createState() => _OtpverificationScreenState();
}

class _OtpverificationScreenState extends State<OtpverificationScreen> {
  bool complete = false;
  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pinController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      complete = (pinController.text).length == 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultpintheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 22, color: blackcolor),
      decoration: BoxDecoration(
        color: fillcolor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              headertext: GateafricaTexts.enterpin,
              smalltext: GateafricaTexts.sensitive,
              route: ForgotpasswordScreen(),
            ),
            SizedBox(height: 5),
            Container(
              width: double.infinity,

              child: Pinput(
                controller: pinController,
                obscureText: true,
                length: 4,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                defaultPinTheme: defaultpintheme,
                focusedPinTheme: defaultpintheme.copyWith(
                  decoration: defaultpintheme.decoration!.copyWith(
                    border: Border.all(color: greenbordercolor),
                  ),
                ),
              ),
            ),

            Spacer(),
            Button(
              texts: GateafricaTexts.proceed,
              route: TokensuccessfulScreen(),
              background: complete ? greencolor : buttoncolor,
            ),
          ],
        ),
      ),
    );
  }
}
