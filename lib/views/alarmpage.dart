import 'package:demoalarm/data.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Alarm",
              style: TextStyle(
                  fontFamily: "avenir",
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 24),
            ),
            Expanded(
              child: ListView(
                children: alarms.map((alarm) {
                  return
                   Container(
                    margin:EdgeInsets.only(top:10),
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 3),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.purple, Colors.red],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 2,
                            color: Colors.red.withOpacity(0.4),
                            offset: Offset(
                            1, 1)
                          )
                        ]
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.label,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                Text(
                                  alarm.description.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: "avenir"),
                                ),
                              ],
                            ),
                            Switch(
                              value: true, activeColor: Colors.white,
                              onChanged: (bool value) {}
                              ),
                          ],
                        ),
                   Text("Mon- Fri",style: TextStyle(color: Colors.white,fontFamily: "avenir"),),
                   Text("07:00 AM",style: TextStyle(color: Colors.white,fontFamily: "avenir",fontSize: 15,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  );
                }).followedBy([
                  Container(
                    height: 100,
                   // color: Colors.grey.shade600, 
                     margin:EdgeInsets.only(top:20),
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 3),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.grey.shade700, Colors.grey.shade900],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 2,
                            color: Colors.grey.withOpacity(0.4),
                            offset: Offset(
                            1, 1)
                          )
                        ]
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                     children:<Widget>[
                      Image.asset("assets/add_alarm.png",
                      scale: 1.5,),
                      SizedBox(height: 6,),
                      Text("Add Alarm",style: TextStyle(color: Colors.white),)
                     ] 
                    ),
                    )
                ]).toList(),
              ),
            ),
          ]),
    );
  }
}
