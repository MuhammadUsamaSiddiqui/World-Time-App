import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api end point
  bool isDaytime;   //true or false if day time or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);

      // get properties from Data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Error caught : $e');
      time = 'Could not get time data';
    }
  }
}
