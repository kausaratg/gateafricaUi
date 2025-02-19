import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';
import 'package:gateafricapp/screens/signin_screen.dart';
import 'package:gateafricapp/screens/tokenid_screen.dart';

class ForgotpasswordScreen extends StatefulWidget {
  const ForgotpasswordScreen({super.key});

  @override
  State<ForgotpasswordScreen> createState() => _ForgotpasswordScreenState();
}

class _ForgotpasswordScreenState extends State<ForgotpasswordScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Header(
              headertext: GateafricaTexts.forgotpassword,
              smalltext: GateafricaTexts.enter,
              route: SigninScreen(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: bordercolor),

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        GateafricaTexts.tokenidtext,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: textscolor,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        GateafricaTexts.entertokenid,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          color: smalltextcolor,
                        ),
                      ),
                    ],
                  ),
                  Radio<bool>(
                    value: true,
                    groupValue: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    activeColor: greencolor,
                  ),
                ],
              ),
            ),
            Spacer(),
            Button(
              texts: GateafricaTexts.proceed,
              route: TokenidScreen(),
              background: isChecked ? greencolor : buttoncolor,
            ),
          ],
        ),
      ),
    );
  }
}
