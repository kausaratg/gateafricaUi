import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/assets.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/declinereason_screen.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';
import 'package:gateafricapp/screens/invite_active.dart';

class AccessheldScreen extends StatefulWidget {
  const AccessheldScreen({super.key});

  @override
  State<AccessheldScreen> createState() => _AccessheldScreenState();
}

class _AccessheldScreenState extends State<AccessheldScreen> {
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
          headertext: GateafricaTexts.accessheld,
          imageicon: accessheld,
          texts: GateafricaTexts.accessheld,
          backgroundcolor: lightyellowcolor,
          textcolor: deepyellowcolor,
          route: DeclinereasonScreen(),
          buttonbackground: deepyellowcolor,
          
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: InviteActive());
  }
}
