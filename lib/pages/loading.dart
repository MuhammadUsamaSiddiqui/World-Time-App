import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading Screen'),
    );
  }

  void getTime() async {
    Response response =
        await get('http://worldtimeapi.org/api/timezone/Asia/Karachi');
    Map data = jsonDecode(response.body);

    // get properties from Data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    // create date time object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(datetime);

  }
}
