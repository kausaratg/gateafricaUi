import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/assets.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';
import 'package:gateafricapp/screens/holdreason_screen.dart';

class AccessgrantedScreen extends StatefulWidget {
  const AccessgrantedScreen({super.key});

  @override
  State<AccessgrantedScreen> createState() => _AccessgrantedScreenState();
}

class _AccessgrantedScreenState extends State<AccessgrantedScreen> {
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
        return ModalBottomContent(
          headertext:  GateafricaTexts.accessgranted,
          isThisAccessGranted: true,
          imageicon: checkcircle,
          texts: GateafricaTexts.accessgranted,
          backgroundcolor: lightgreencolor,
          textcolor: deepgreencolor,
          route: HoldreasonScreen(),
        );
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
