import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }

  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Karachi', flag: 'germany.png', url: 'Asia/Karachi');
    await worldTime.getTime();
    print(worldTime.time);
    /*setState(() {
      time = worldTime.time;
    });*/
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'time': worldTime.time,
      'flag': worldTime.flag,
      'isDaytime': worldTime.isDaytime
    });
  }
}
