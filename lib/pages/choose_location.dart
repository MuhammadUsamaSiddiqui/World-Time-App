import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Choose a Location'),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (BuildContext context, int position) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                  child: Card(
                      child: ListTile(
                          onTap: () {},
                          title: Text(locations[position].location),
                          leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/${locations[position].flag}')))));
            }));
  }
}
