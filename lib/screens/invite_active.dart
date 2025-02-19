import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/assets.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';
import 'package:gateafricapp/screens/tokenpin_reset.dart';

class InviteActive extends StatelessWidget {
  const InviteActive({super.key});

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
                imagestatus: checkcircle,
              ),
              RowElement(
                text1: GateafricaTexts.receipt,
                text2: GateafricaTexts.at,
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
              Button(texts: GateafricaTexts.close, route: InviteActive()),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Button(
                      texts: GateafricaTexts.hold,
                      route: TokenpinReset(),
                      isThisrow: true,
                      background: deepyellowcolor,
                    ),
                  ),
                  SizedBox(width: 17),
                  Expanded(
                    child: Button(
                      texts: GateafricaTexts.decline,
                      route: InviteActive(),
                      isThisrow: true,
                      background: redcolor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
