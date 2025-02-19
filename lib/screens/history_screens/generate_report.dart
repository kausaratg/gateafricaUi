import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/assets.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/models/gateafrica_model.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';
import 'package:gateafricapp/screens/history_screens/detail_screen.dart';
import 'package:gateafricapp/screens/history_screens/modalsheet_content.dart';

class GeneratereportScreen extends StatefulWidget {
  const GeneratereportScreen({super.key});

  @override
  State<GeneratereportScreen> createState() => _GeneratereportScreenState();
}

class _GeneratereportScreenState extends State<GeneratereportScreen> {
  void showBottomSheet(BuildContext context, content) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return content;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {}, icon: Image.asset(backicon)),
              Center(
                child: Text(
                  GateafricaTexts.generatereport,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: greencolor,
                  ),
                ),
              ),
              SizedBox(height: 9),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Image.asset(searchicon),
                  hintText: GateafricaTexts.guestsearch,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: hinttextcolor,
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 9,
                    horizontal: 16,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fillColor: fillcolor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: fillcolor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // sort Icon
                  GestureDetector(
                    onTap: () {
                      showBottomSheet(context, SortBy());
                    },
                    child: Row(
                      children: [
                        Text(
                          GateafricaTexts.sort,
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            color: sortcolor,
                          ),
                        ),
                        Image.asset(sorticon),
                      ],
                    ),
                  ),
                  // view all icon
                  GestureDetector(
                    onTap: () {
                     
                    },
                    child: Text(
                      GateafricaTexts.viewall,
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: greencolor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Text(
                GateafricaTexts.octoberdate,
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  color: greencolor,
                ),
              ),
              SizedBox(height: 4),
              ListView.builder(
                shrinkWrap: true,
                itemCount: userstatus.length,
                itemBuilder: (context, index) {
                  final user = userstatus[index];
                  return GestureDetector(
                    onTap: () {
                      UserStatus users;
                      showBottomSheet(context, Options(users: user));
                    },
                    child: Report(
                      name: userstatus[index].username,
                      date: userstatus[index].date,
                      status: userstatus[index].status,
                      background: userstatus[index].backgroundcolor,
                      textcolor: userstatus[index].textcolor,
                      id: userstatus[index].id,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Report extends StatelessWidget {
  const Report({
    super.key,
    required this.name,
    required this.date,
    this.status = "",
    this.isthisIcon = false,
    this.iconimage = "",
    this.background = redcolor,
    this.textcolor = redcolor,
    this.id = "",
  });
  final String name;
  final String date;
  final String status;
  final bool isthisIcon;
  final String iconimage;
  final Color background;
  final Color textcolor;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: bordercolor),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: name,
                          style: TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.w700,
                            color: smalltextcolor,
                          ),
                        ),
                        if (!isthisIcon)
                          TextSpan(
                            text: " - ",
                            style: TextStyle(
                              fontSize: 7,
                              fontWeight: FontWeight.w700,
                              color: smalltextcolor,
                            ),
                          ),
                        TextSpan(
                          text: id,
                          style: TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.w700,
                            color: smalltextcolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                      color: smalltextcolor,
                    ),
                  ),
                ],
              ),
              if (isthisIcon)
                Image.asset(iconimage)
              else
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 13.5),
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      status,
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
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
