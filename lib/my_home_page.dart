import 'package:clock_app/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('hh:mm').format(now);
    var formattedMeridium = DateFormat('a').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);

    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Scaffold(
        backgroundColor: Color(0xFF2D2F41),
        body: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMenuButton('Clock', 'assets/clock_icon.png'),
                buildMenuButton('Alarm', 'assets/alarm_icon.png'),
                buildMenuButton('Timer', 'assets/timer_icon.png'),
                buildMenuButton('StopWatch', 'assets/stopwatch_icon.png'),
              ],
            ),
            VerticalDivider(color: Colors.white12, width: 1),
            Container(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Clock",
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(formattedTime,
                          style: TextStyle(color: Colors.white, fontSize: 64)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10),
                        child: Text(formattedMeridium,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ],
                  ),
                  Text(formattedDate,
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  ClockView(),
                  Text("TimeZone",
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text("UTC" + offsetSign + timezoneString,
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  Padding buildMenuButton(String title, String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: FlatButton(
        onPressed: () {},
        child: Column(
          children: [
            Image.asset(
              imagePath,
              scale: 1.5,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
