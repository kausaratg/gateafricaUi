import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/assets.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/models/gateafrica_model.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';
import 'package:gateafricapp/screens/history_screens/generate_report.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.user});
  final UserStatus user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GeneratereportScreen(),
                    ),
                  );
                },
                icon: Image.asset(backicon),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      user.username,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user.id,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 4),
                        Image.asset(copy),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      user.date,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: browngreycolor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 48),
              ReceiptElement(text1: GateafricaTexts.referenceid, text2: user.id),
              ReceiptElement(
                text1: GateafricaTexts.trackid,
                text2: GateafricaTexts.idnum,
              ),
              RowElement(
                text1: GateafricaTexts.receiptstatus,
                text2: user.status,
                backgroundcolor: user.backgroundcolor,
                textcolor: user.textcolor,
              ),
              ReceiptElement(text1: GateafricaTexts.expected, text2: user.date),
              ReceiptElement(
                text1: GateafricaTexts.timeofstatus,
                text2: GateafricaTexts.datetime,
              ),
              ReceiptElement(
                text1: GateafricaTexts.statusby,
                text2: GateafricaTexts.asecurity,
              ),
              ReceiptElement(
                text1: GateafricaTexts.numberofguest,
                text2: GateafricaTexts.num,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
