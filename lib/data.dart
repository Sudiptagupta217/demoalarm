import 'package:demoalarm/enums.dart';
import 'package:demoalarm/models/alarm_info.dart';
import 'package:demoalarm/models/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: "Clock", imageSource: "assets/clock_icon.png"),
  MenuInfo(MenuType.alarm,
      title: "Alarm", imageSource: "assets/alarm_icon.png"),
  MenuInfo(MenuType.timer,
      title: "Timer", imageSource: "assets/timer_icon.png"),
  MenuInfo(MenuType.stopwatch,
      title: "Stopwatcha", imageSource: "assets/stopwatch_icon.png"),
];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),description: "office alarm"),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)),description: "Sport"),
];
