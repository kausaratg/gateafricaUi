import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/entry_code.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';
import 'package:gateafricapp/screens/tokenid_screen.dart';

class TokensuccessfulScreen extends StatefulWidget {
  const TokensuccessfulScreen({super.key});

  @override
  State<TokensuccessfulScreen> createState() => TokensuccessfulScreenState();
}

class TokensuccessfulScreenState extends State<TokensuccessfulScreen> {
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
        return bottomSheetContent(route: EntryCode());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Header(
              headertext: GateafricaTexts.yourtokenid,
              smalltext: GateafricaTexts.senttoken,
              route: TokenidScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
