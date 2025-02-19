import 'package:flutter/material.dart';
import 'package:gateafricapp/constants/assets.dart';
import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';
import 'package:gateafricapp/screens/advanceddetail_screen.dart';
import 'package:gateafricapp/screens/gateafrica_widget.dart';
import 'package:gateafricapp/screens/history_screens/detail_screen.dart';
import 'package:gateafricapp/screens/history_screens/generate_report.dart';
import 'package:gateafricapp/screens/otpverification_screen.dart';
import 'package:intl/intl.dart';

class Options extends StatelessWidget {
  const Options({super.key, this.users});
  final users;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TopButtomSheet(texts: GateafricaTexts.options),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(user: users),
                ),
              );
            },
            child: Report(
              name: GateafricaTexts.viewdetails,
              date: GateafricaTexts.alldetail,
              isthisIcon: true,
              iconimage: viewlist,
            ),
          ),
          Report(
            name: GateafricaTexts.pdf,
            date: GateafricaTexts.sharehistory,
            isthisIcon: true,
            iconimage: share,
          ),
          SizedBox(height: 54),
          Button(texts: GateafricaTexts.close, route: GeneratereportScreen()),
        ],
      ),
    );
    ;
  }
}

// sortBy content
class SortBy extends StatelessWidget {
  const SortBy({super.key});
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
    return Container(
      padding: EdgeInsets.all(24),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TopButtomSheet(texts: GateafricaTexts.sortby),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              showBottomSheet(context, StatusSort());
            },
            child: Report(
              name: GateafricaTexts.bystatus,
              date: GateafricaTexts.viewhistory,
              isthisIcon: true,
              iconimage: viewlist,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              showBottomSheet(context, DateSort());
            },
            child: Report(
              name: GateafricaTexts.bydate,
              date: GateafricaTexts.viewhistorybydate,
              isthisIcon: true,
              iconimage: share,
            ),
          ),
          SizedBox(height: 54),
          Button(texts: GateafricaTexts.close, route: GeneratereportScreen()),
        ],
      ),
    );
  }
}

// Sort By status
class StatusSort extends StatefulWidget {
  const StatusSort({super.key});

  @override
  State<StatusSort> createState() => _StatusSortState();
}

class _StatusSortState extends State<StatusSort> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TopButtomSheet(texts: GateafricaTexts.sortbystatus),
            StatusElement(
              texts: GateafricaTexts.invited,
              texts2: GateafricaTexts.viewhistoryby,
              value: 'value1',
            ),
            StatusElement(
              texts: GateafricaTexts.revoked,
              texts2: GateafricaTexts.viewhistoryinrevoke,
              value: 'value2',
            ),
            StatusElement(
              texts: GateafricaTexts.expired,
              texts2: GateafricaTexts.viewhistoryexpired,
              value: 'value3',
            ),
            StatusElement(
              texts: GateafricaTexts.accessgranted,
              texts2: GateafricaTexts.viewhistorygranted,
              value: 'value4',
            ),
            SizedBox(height: 29),
            Button(texts: GateafricaTexts.apply, route: GeneratereportScreen()),
          ],
        ),
      ),
    );
  }
}

// items in sort by status
class StatusElement extends StatefulWidget {
  const StatusElement({
    super.key,
    required this.texts,
    required this.texts2,
    required this.value,
  });
  final String texts;
  final String texts2;
  final String value;
  @override
  State<StatusElement> createState() => _StatusElementState();
}

class _StatusElementState extends State<StatusElement> {
  String selectedOption = "value1";
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
                  Text(
                    widget.texts,
                    style: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.w700,
                      color: smalltextcolor,
                    ),
                  ),

                  SizedBox(height: 5),
                  Text(
                    widget.texts2,
                    style: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                      color: smalltextcolor,
                    ),
                  ),
                ],
              ),
              Radio(
                value: widget.value,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value.toString();
                  });
                },
                activeColor: greencolor,
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}

// date Modal Bottom Sheet
class DateSort extends StatefulWidget {
  const DateSort({super.key});

  @override
  State<DateSort> createState() => _DateSortState();
}

class _DateSortState extends State<DateSort> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TopButtomSheet(
              texts: GateafricaTexts.dates,
              date: DateFormat('EEE, MMM d').format(selectedDate),
              isThisDate: true,
            ),

            Theme(
              data: ThemeData(
                // Changes header and selection color
                colorScheme: ColorScheme.light(
                  primary: greencolor, // Header background & selected date
                ),
              ),
              child: CalendarDatePicker(
                firstDate: DateTime(2000),
                initialDate: selectedDate,

                lastDate: DateTime(2100),

                onDateChanged: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
            ),
            SizedBox(height: 21),
            Button(
              texts: GateafricaTexts.choosedate,
              route: OtpverificationScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
