import 'package:flutter/material.dart';
import 'package:task_manager/tab_bar_pages/Projects.dart';
import 'package:task_manager/tab_bar_pages/Reminder.dart';
import 'package:task_manager/tab_bar_pages/Timeline.dart';
import 'package:task_manager/tab_bar_pages/Unplanned.dart';
import 'package:task_manager/tab_bar_pages/Notes.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndex = 0;

  List pages = [
    Timeline(),
    Reminder(),
    Unplanned(),
    Notes(),
  ];
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(IconData(0xe661, fontFamily: 'MaterialIcons')),
              label: 'Timeline'
          ),

          BottomNavigationBarItem(
              icon: Icon(IconData(0xee98, fontFamily: 'MaterialIcons', matchTextDirection: true)),
              label: 'Reminders'
          ),

          BottomNavigationBarItem(
              icon: Icon(IconData(0xf030e, fontFamily: 'MaterialIcons')),
              label: 'Unplanned'
          ),

          BottomNavigationBarItem(
              icon: Icon(IconData(0xf0022, fontFamily: 'MaterialIcons', matchTextDirection: true)),
              label: 'Notes'
          ),
        ],
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.black,
        backgroundColor: Color(0xfff0ecec),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        elevation: 0,
      ),
    );
  }
}
