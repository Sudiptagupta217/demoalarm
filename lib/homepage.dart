import 'package:demoalarm/cloclview.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatedTime = DateFormat('HH:mm').format(now);
    var formatedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = "+";
    return Scaffold(
        backgroundColor: const Color(0xff2D2F41),
        body: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildMenuButton("Clock","assets/clock_icon.png"),
                buildMenuButton("Alarm","assets/alarm_icon.png"),
                buildMenuButton("Time","assets/timer_icon.png"),
                buildMenuButton("Stopwatch","assets/stopwatch_icon.png"),
              ],
            ),
          VerticalDivider(color: Colors.white54,width: 1,),
          
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 64),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(
                        "Clock",
                        style: TextStyle(fontFamily: "avenir", color: Colors.white, fontSize: 24),
                      ),
                    ),
                   
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          Text(
                            formatedTime,
                            style: TextStyle(color: Colors.white, fontSize: 64),
                          ),
                          Text(
                            formatedDate,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),

                    
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: ClockView()),

                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(children: [
                        Text(
                        "Timezone",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.language,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "UTC" + offsetSign + timezoneString,
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ],
                      )
                    ],),
                  )
                  
                  
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Padding buildMenuButton(String title, String image) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 16.0),
      child: TextButton(
                  child: Column(children: [
                    Image.asset(image,scale: 1.5,),
                    SizedBox(height: 16,),
                    Text(title ??'',style: TextStyle(fontFamily: "avenir", color: Colors.white),)
                  ]),
                  onPressed: () {},
                ),
    );
  }
}
