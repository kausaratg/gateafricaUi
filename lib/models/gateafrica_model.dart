import 'package:gateafricapp/constants/gateAfrica_colors.dart';
import 'package:gateafricapp/constants/gateAfrica_texts.dart';

class UserStatus {
  var username;
  var id;
  var date;
  var status;
  var backgroundcolor;
  var textcolor;

  UserStatus(
    this.username,
    this.date,
    this.status,
    this.id,
    this.backgroundcolor,
    this.textcolor,
  );
}

//populating model with dummy data
List<UserStatus> userstatus = [
  UserStatus(
    GateafricaTexts.username1,
    GateafricaTexts.date,
    GateafricaTexts.status1,
    GateafricaTexts.id1,
    lightgreencolor,
    deepgreencolor,
  ),
  UserStatus(
    GateafricaTexts.username2,
    GateafricaTexts.date,
    GateafricaTexts.status2,
    GateafricaTexts.id2,
    lightredcolor,
    deepredcolor,
  ),
  UserStatus(
    GateafricaTexts.username2,
    GateafricaTexts.date,
    GateafricaTexts.status3,
    GateafricaTexts.id2,
    lightyellowcontainer,
    deepyellowcontainer,
  ),
  UserStatus(
    GateafricaTexts.username3,
    GateafricaTexts.date,
    GateafricaTexts.status4,
    GateafricaTexts.id3,
    lightredcolor,
    deepredcolor,
  ),
];
