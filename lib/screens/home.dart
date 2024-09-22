import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:money_gram/pages/history.dart';
import 'package:money_gram/pages/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currenntPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const Center(child: HomePage()),
        const Center(
          child: Text("Accounts"),
        ),
        const HistoryPage(),
        const Center(
          child: Text("Profile"),
        ),
      ][currenntPageIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: currenntPageIndex,
        onDestinationSelected: (value) {
          setState(() {
            currenntPageIndex = value;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(HugeIcons.strokeRoundedHome11),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(HugeIcons.strokeRoundedPlusSign),
            label: "Accounts",
          ),
          NavigationDestination(
            icon: Icon(HugeIcons.strokeRoundedClock01),
            label: "History",
          ),
          NavigationDestination(
            icon: Icon(HugeIcons.strokeRoundedUser),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
