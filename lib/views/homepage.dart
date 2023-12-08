import 'package:demoalarm/views/clockpage.dart';
import 'package:demoalarm/views/cloclview.dart';
import 'package:demoalarm/data.dart';
import 'package:demoalarm/enums.dart';
import 'package:demoalarm/models/menu_info.dart';
import 'package:demoalarm/views/alarmpage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
              children: menuItems
                  .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                  .toList(),
            ),
            VerticalDivider(
              color: Colors.white54,
              width: 1,
            ),
            Expanded(
              child: Consumer<MenuInfo>(builder:
                  (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType == MenuType.clock) return ClockPage();
              else if(value.menuType == MenuType.alarm) 
              return AlarmPage();
               else
                return Container();
              }),
            ),
          ],
        ));
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
        builder: (BuildContext context, MenuInfo value, Widget? child) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: InkWell(
          onTap: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: currentMenuInfo.title == value.menuType
                ? Colors.red
                : Colors.transparent,
            child: Column(children: [
              Image.asset(
                currentMenuInfo.imageSource!,
                scale: 1.5,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                currentMenuInfo.title ?? '',
                style: TextStyle(fontFamily: "avenir", color: Colors.white),
              )
            ]),
          ),
        ),
      );
    });
  }
}
