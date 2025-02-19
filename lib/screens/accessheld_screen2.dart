import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/assets.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';

class AccessheldScreen2 extends StatelessWidget {
  const AccessheldScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(21),
          child: Column(
            children: [
              TopSpace(
                status: GateafricaTexts.accessheld,
                imagestatus: accessheld,
              ),
              SizedBox(height: 116),
              Button(
                texts: GateafricaTexts.continuehold,
                route: AccessheldScreen2(),
                background: deepyellowcolor,
              ),
              SizedBox(height: 16),
              Button(
                texts: GateafricaTexts.grantaccess,
                route: AccessheldScreen2(),
              ),
              SizedBox(height: 16),
              Button(
                texts: GateafricaTexts.declineaccess,
                route: AccessheldScreen2(),
                background: redcolor,
              ),
              SizedBox(height: 48),
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
