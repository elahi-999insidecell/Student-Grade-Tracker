import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentgradetracker/screens/add_subject.dart';
import 'package:studentgradetracker/screens/navigation_provider.dart';
import 'package:studentgradetracker/screens/subject_list.dart';
import 'package:studentgradetracker/screens/summary.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = context.watch<NavigationProvider>();

    final List<Widget> pages = [
      AddSubject(),
      SubjectList(),
      SummaryScreen()
    ];

    return Scaffold(
      body: pages[navigationProvider.currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationProvider.currentIndex,

        onTap: (index) {
          context.read<NavigationProvider>().changeIndex(index);
        },

        items: [
          //add subject page
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            activeIcon: Icon(Icons.add),
            label: "Add Subject",
          ),

          //Subject List page
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            activeIcon: Icon(Icons.list),
            label: "Subject List",
          ),

          //summary screen
          BottomNavigationBarItem(
            icon: Icon(Icons.summarize_rounded),
            activeIcon: Icon(Icons.summarize),
            label: "Summary",
          ),
        ],
      ),
    );
  }
}