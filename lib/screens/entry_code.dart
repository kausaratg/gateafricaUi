import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/code_expired.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';
import 'package:pinput/pinput.dart';

class EntryCode extends StatefulWidget {
  const EntryCode({super.key});

  @override
  State<EntryCode> createState() => _EntryCodeState();
}

class _EntryCodeState extends State<EntryCode> {
  bool complete = false;
  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pinController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      complete = (pinController.text).length == 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultpintheme = PinTheme(
      width: 46,
      height: 46,
      textStyle: TextStyle(fontSize: 22, color: blackcolor),
      decoration: BoxDecoration(
        color: fillcolor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TopButton(texts: GateafricaTexts.entry),
                SizedBox(width: 12),
                TopButton(texts: GateafricaTexts.exit, isThisExist: true),
              ],
            ),
            SizedBox(height: 24),
            Text(
              GateafricaTexts.entercode,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: greencolor,
              ),
            ),
            Text(
              GateafricaTexts.codepresented,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: smalltextcolor,
              ),
            ),
            SizedBox(height: 35),
            Container(
              width: double.infinity,
              child: Pinput(
                controller: pinController,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                obscureText: true,
                length: 6,
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
              texts: GateafricaTexts.checkcode,
              route: CodeExpired(),
              background: complete ? greencolor : buttoncolor,
            ),
            SizedBox(height: 28),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: GateafricaTexts.history,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: bottomtextcolor,
                          ),
                        ),
                        TextSpan(
                          text: "|",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: GateafricaTexts.logout,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: bottomtextcolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    GateafricaTexts.estate,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: bottomtextcolor,
                    ),
                  ),
                  Text(
                    GateafricaTexts.version,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: bottomtextcolor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopButton extends StatelessWidget {
  const TopButton({super.key, required this.texts, this.isThisExist = false});

  final String texts;
  final bool isThisExist;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101,
      height: 28,
      decoration: BoxDecoration(
        color: isThisExist ? fillcolor : greencolor,
        border: Border.all(
          width: 1,
          color: isThisExist ? boxbordercolor : greencolor,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Center(
        child: Text(
          texts,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w400,
            color: isThisExist ? blackcolor : primarycolor,
          ),
        ),
      ),
    );
  }
}
