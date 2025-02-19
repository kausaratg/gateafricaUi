import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/assets.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/accessgranted_screen.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';

class TokenpinReset extends StatefulWidget {
  const TokenpinReset({super.key});

  @override
  State<TokenpinReset> createState() => _TokenpinResetState();
}

class _TokenpinResetState extends State<TokenpinReset> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (context) {
        return bottomSheetContent(route:AccessgrantedScreen(),);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TopSpace(status: GateafricaTexts.invite, imagestatus: checkcircle),
          ],
        ),
      ),
    );
  }
}
