import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/assets.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/accessheld_screen.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';
import 'package:gateafricapp/screens/inviteactive_screen2.dart';

class DeclinereasonScreen extends StatefulWidget {
  const DeclinereasonScreen({super.key});

  @override
  State<DeclinereasonScreen> createState() => _DeclinereasonScreenState();
}

class _DeclinereasonScreenState extends State<DeclinereasonScreen> {
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
        return Container(padding: EdgeInsets.all(26), child: ReasonQuestion());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: InviteActiveWidget());
  }
}

class ReasonQuestion extends StatefulWidget {
  const ReasonQuestion({super.key});

  @override
  State<ReasonQuestion> createState() => _ReasonQuestionState();
}

class _ReasonQuestionState extends State<ReasonQuestion> {
  bool isButtonEnable = false;
  String userid = "";
  TextEditingController textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    textController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnable = textController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Questions(
      textController: textController,
      isButtonEnable: isButtonEnable,
      bigtexts: GateafricaTexts.enterdeclinereason,
      smalltexts: GateafricaTexts.reasonfordecline,
      placeholdertexts: GateafricaTexts.enterthedecline,
      route: InviteactiveScreen2(),
      buttontext: GateafricaTexts.declineaccess,
    );
  }
}
