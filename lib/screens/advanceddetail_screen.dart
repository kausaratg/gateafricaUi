import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';
import 'package:gateafricapp/screens/history_screens/generate_report.dart';

class AdvanceddetailScreen extends StatefulWidget {
  const AdvanceddetailScreen({super.key});

  @override
  State<AdvanceddetailScreen> createState() => _AdvanceddetailScreenState();
}

class _AdvanceddetailScreenState extends State<AdvanceddetailScreen> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TopButtomSheet(texts: GateafricaTexts.advanceddetail),
                AdvancedElement(
                  text1: GateafricaTexts.outbound,
                  text2: GateafricaTexts.yes,
                ),
                AdvancedElement(
                  text1: GateafricaTexts.checkidofguest,
                  text2: GateafricaTexts.yes,
                  textcolor: skybluecolor,
                ),
                AdvancedElement(
                  text1: GateafricaTexts.searchguest,
                  text2: GateafricaTexts.yes,
                  textcolor: skybluecolor,
                ),
                AdvancedElement(
                  text1: GateafricaTexts.numberofguest,
                  text2: GateafricaTexts.yes,
                ),
                AdvancedElement(
                  text1: GateafricaTexts.nameofguest,
                  text2: GateafricaTexts.guest,
                ),
                AdvancedElement(
                  text1: GateafricaTexts.mote,
                  text2: GateafricaTexts.guest,
                ),
                AdvancedElement(
                  text1: GateafricaTexts.expectations,
                  text2: GateafricaTexts.human,
                  borderscolor: cbluecolor,
                ),
                AdvancedElement(
                  text1: GateafricaTexts.numbertocall,
                  text2: GateafricaTexts.phonenum,
                  borderscolor: cbluecolor,
                ),
                SizedBox(height: 148),
                Button(
                  texts: GateafricaTexts.grantaccess,
                  route: AdvanceddetailScreen(),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Button(
                        texts: GateafricaTexts.hold,
                        route: GeneratereportScreen(),
                        isThisrow: true,
                        background: deepyellowcolor,
                      ),
                    ),
                    SizedBox(width: 17),
                    Expanded(
                      child: Button(
                        texts: GateafricaTexts.decline,
                        route: AdvanceddetailScreen(),
                        isThisrow: true,
                        background: redcolor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class AdvancedElement extends StatelessWidget {
  const AdvancedElement({
    super.key,
    required this.text1,
    required this.text2,
    this.textcolor = deepbluecolor,
    this.borderscolor = bordercolor,
  });
  final String text1;
  final String text2;
  final Color textcolor;
  final Color borderscolor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 6.5, horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: borderscolor),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: textcolor,
                ),
              ),
              Text(
                text2,
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  color: greycolor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 9),
      ],
    );
  }
}
