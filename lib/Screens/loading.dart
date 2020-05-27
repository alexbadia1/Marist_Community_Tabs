import 'package:communitytabs/data/club_event_data.dart';
import 'package:flutter/material.dart';
import 'package:communitytabs/colors/marist_color_scheme.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void loading () async {
    List<ClubEventData> _eventList;
    ClubEventData defaultEvent = new ClubEventData.nullConstructor();
    _eventList = [defaultEvent];
    //5.) Pass the list to the home page
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, '/home', arguments: {
      'events': _eventList });
    });
  }

  @override
  void initState() {
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration (
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color> [
                cWashedRed,
                cFullRed,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
