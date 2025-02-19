import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/assets.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';
import 'package:gateafricapp/screens/inviteactive_screen.dart';

class CodeExpired extends StatelessWidget {
  const CodeExpired({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TopSpace(imagestatus: invalidcircle, status: GateafricaTexts.code),

            Text(
              GateafricaTexts.logged,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: textgreycolor,
              ),
            ),
            Text(
              GateafricaTexts.system,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: textgreycolor,
              ),
            ),
            Spacer(),
            Button(texts: GateafricaTexts.close, route: InviteActive(), background: redcolor,),
          ],
        ),
      ),
    );
  }
}
