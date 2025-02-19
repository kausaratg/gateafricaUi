import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/assets.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';

class PasswordForm extends StatefulWidget {
  const PasswordForm({
    super.key,
    required this.labeltexts,
    required this.placeholder,
    required this.pinController,
  });
  final String labeltexts;
  final String placeholder;
  final pinController;

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  bool isobscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labeltexts,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: double.infinity,
          child: TextFormField(
            controller: widget.pinController,
            obscureText: isobscure,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 19,
                horizontal: 16,
              ),
              floatingLabelStyle: null,
              hintText: widget.placeholder,
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: lightgreycolor,
              ),

              filled: true,

              fillColor: fillcolor,

              focusColor: fillcolor,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: fillcolor, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              suffixIcon: IconButton(
                icon: Icon(isobscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    isobscure = !isobscure;
                  });
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 9),
      ],
    );
  }
}

class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.labeltexts,
    required this.placeholder,
    required this.idController,
  });
  final String labeltexts;
  final String placeholder;
  final idController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labeltexts,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: double.infinity,
          child: TextFormField(
            controller: idController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 19,
                horizontal: 16,
              ),
              hintText: placeholder,
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: lightgreycolor,
              ),
              filled: true,

              fillColor: fillcolor,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: fillcolor, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        SizedBox(height: 9),
      ],
    );
  }
}

// header Widget
class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.headertext,
    required this.smalltext,
    required this.route,
  });
  final String headertext;
  final String smalltext;
  final route;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => route),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        SizedBox(height: 16),
        Text(
          headertext,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: greencolor,
          ),
        ),
        Text(
          smalltext,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: greycolor,
          ),
        ),
        SizedBox(height: 23),
      ],
    );
  }
}

//gateafrica Button
class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.texts,
    required this.route,
    this.isThisrow = false,
    this.background = greencolor,
  });
  final String texts;
  final route;
  final isThisrow;
  final Color background;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,

      width: isThisrow ? 0 : double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          );
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: background, width: 1),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        child: Text(
          texts,

          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: primarycolor,
          ),
        ),
      ),
    );
  }
}

class TopSpace extends StatelessWidget {
  const TopSpace({super.key, required this.status, required this.imagestatus});
  final String status;
  final String imagestatus;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagestatus),
        SizedBox(height: 12),
        Text(
          status,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 42),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: bordercolor),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Text(
              GateafricaTexts.num1,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        SizedBox(height: 41),
      ],
    );
  }
}

// modal bottom sheet

class bottomSheetContent extends StatelessWidget {
  const bottomSheetContent({super.key, required this.route});
  final route;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      width: double.infinity,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TopButtomSheet(texts: GateafricaTexts.pinreset),
          SizedBox(
            width: 317,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Image.asset(checkcircle)),
                SizedBox(height: 24),
                Text(
                  GateafricaTexts.pinsuccessful,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 8),
                Text(
                  GateafricaTexts.tokenshorttext,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: shorttextcolor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Button(texts: GateafricaTexts.todashboard, route: route),
        ],
      ),
    );
  }
}

class TopButtomSheet extends StatelessWidget {
  const TopButtomSheet({
    super.key,
    required this.texts,
    this.isThisDate = false,
    this.date = " ",
  });
  final String texts;
  final bool isThisDate;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: texts,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: greencolor,
                    ),
                  ),
                  if (isThisDate)
                    TextSpan(
                      text: date,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: greencolor,
                      ),
                    ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(cancelicon),
            ),
          ],
        ),
        Divider(
          color: bordercolor, // Line color
          thickness: 1, // Line thickness
        ),
      ],
    );
  }
}

class RowElement extends StatelessWidget {
  const RowElement({
    super.key,
    required this.text1,
    required this.text2,
    required this.backgroundcolor,
    required this.textcolor,
  });
  final String text1;
  final String text2;
  final Color backgroundcolor;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FirstElement(texts: text1),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16.5),
              decoration: BoxDecoration(
                color: backgroundcolor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  text2,
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: textcolor,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 32),
      ],
    );
  }
}

class ReceiptElement extends StatelessWidget {
  const ReceiptElement({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FirstElement(texts: text1),
            Text(
              text2,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: blacktextcolor,
              ),
            ),
          ],
        ),
        SizedBox(height: 32),
      ],
    );
  }
}

class FirstElement extends StatelessWidget {
  const FirstElement({super.key, required this.texts});
  final String texts;
  @override
  Widget build(BuildContext context) {
    return Text(
      texts,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: greytextcolor,
      ),
    );
  }
}

class ModalBottomContent extends StatelessWidget {
  const ModalBottomContent({
    super.key,
    this.isThisAccessGranted = false,
    required this.imageicon,
    required this.texts,
    required this.textcolor,
    required this.backgroundcolor,
    required this.headertext,
    required this.route,
    this.buttonbackground = greencolor,
  });
  final bool isThisAccessGranted;
  final String imageicon;
  final String texts;
  final Color textcolor;
  final Color backgroundcolor;
  final String headertext;
  final route;
  final Color buttonbackground;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(26),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TopButtomSheet(texts: headertext),
            Image.asset(imageicon),
            Text(
              texts,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: blacktextcolor,
              ),
            ),
            SizedBox(height: 21.5),
            if (isThisAccessGranted)
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: containerbordercolor),

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
                      GateafricaTexts.confirmaddress,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: greycolor,
                      ),
                    ),
                    Text(
                      GateafricaTexts.address,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: textscolor,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 32),
            ReceiptElement(
              text1: GateafricaTexts.invitedby,
              text2: GateafricaTexts.name,
            ),
            ReceiptElement(
              text1: GateafricaTexts.referenceid,
              text2: GateafricaTexts.referencenum,
            ),
            RowElement(
              text1: GateafricaTexts.receiptstatus,
              text2: GateafricaTexts.accessgranted,
              backgroundcolor: backgroundcolor,
              textcolor: textcolor,
            ),
            ReceiptElement(
              text1: GateafricaTexts.timeofstatus,
              text2: GateafricaTexts.datetime,
            ),
            ReceiptElement(
              text1: GateafricaTexts.statusby,
              text2: GateafricaTexts.asecurity,
            ),
            // Spacer(),
            Button(
              texts: GateafricaTexts.close,
              route: route,
              background: buttonbackground,
            ),
          ],
        ),
      ),
    );
  }
}

// invite Active page
class InviteActiveWidget extends StatelessWidget {
  const InviteActiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          TopSpace(status: GateafricaTexts.invite, imagestatus: checkcircle),
        ],
      ),
    );
  }
}

// modalshowquestions
class Questions extends StatelessWidget {
  const Questions({
    super.key,
    required this.textController,
    required this.isButtonEnable,
    required this.bigtexts,
    required this.smalltexts,
    required this.placeholdertexts,
    required this.route,
    required this.buttontext,
  });

  final TextEditingController textController;
  final bool isButtonEnable;
  final String bigtexts;
  final String smalltexts;
  final String placeholdertexts;
  final route;
  final String buttontext;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopButtomSheet(texts: bigtexts),
        Text(
          smalltexts,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: blacktextcolor,
          ),
        ),
        TextFormField(
          controller: textController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 8, bottom: 67, left: 16),
            filled: true,
            fillColor: fillcolor,
            hintText: placeholdertexts,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: hinttextcolor,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: fillcolor, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        SizedBox(height: 136),
        Button(
          texts: buttontext,
          route: route,
          background: isButtonEnable ? greencolor : buttoncolor,
        ),
      ],
    );
  }
}
