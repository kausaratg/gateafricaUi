import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/assets.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/accessheld_screen2.dart';
import 'package:gateafricapp/screens/advanceddetail_screen.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';

class InviteactiveScreen2 extends StatelessWidget {
  const InviteactiveScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              TopSpace(
                status: GateafricaTexts.invite,
                imagestatus: blackcircle,
              ),
              SizedBox(height: 65),
              RowElement(
                text1: GateafricaTexts.receiptstatus,
                text2: GateafricaTexts.estategate,
                backgroundcolor: lightbluecolor,
                textcolor: bluecolor,
              ),
              ReceiptElement(
                text1: GateafricaTexts.expected,
                text2: GateafricaTexts.date,
              ),
              ReceiptElement(
                text1: GateafricaTexts.time,
                text2: GateafricaTexts.timepm,
              ),
              ReceiptElement(
                text1: GateafricaTexts.numberofguest,
                text2: GateafricaTexts.num,
              ),
              SizedBox(height: 71),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdvanceddetailScreen(),
                    ),
                  );
                },
                child: Text(
                  GateafricaTexts.advancedspecifications,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: blacktextcolor,
                  ),
                ),
              ),
              SizedBox(height: 13),
              Button(
                texts: GateafricaTexts.close,
                route: AccessheldScreen2(),
                background: darkcolor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
