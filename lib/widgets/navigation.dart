import "package:flutter/material.dart";
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:planify/screens/pages/calendar.dart';
import 'package:planify/screens/pages/explore.dart';
import 'package:planify/screens//pages/inbox.dart';
import 'package:planify/screens/pages/profile.dart';

class BottomNavig extends StatefulWidget {
  const BottomNavig({super.key, required Null Function(dynamic index) onTap, required Color backgroundColor, required Color buttonBackgroundColor, required List<Icon> items});

  @override
  State<BottomNavig> createState() => _BottomNavigState();
}

class _BottomNavigState extends State<BottomNavig> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ExploreScreen(),
    const InboxScreen(),
    const CalendarScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 104, 10, 255),
        animationDuration: const Duration(milliseconds: 500),
        onTap: _onItemTapped, 
        items: const [
          Icon(Icons.explore, color: Colors.white),
          Icon(Icons.chat, color: Colors.white),
          Icon(Icons.calendar_month, color: Colors.white),
          Icon(Icons.person_3, color: Colors.white),
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
