import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:planify/components/colors.dart';
import 'package:planify/screens/pages/explore.dart';
import 'package:planify/screens/pages/calendar.dart';
import 'package:planify/screens/pages/inbox.dart';
import 'package:planify/screens/pages/profile.dart';
import 'package:planify/screens/routes/aboutus.dart';
import 'package:planify/screens/routes/category.dart';
import 'package:planify/screens/routes/favorites.dart';
import 'package:planify/screens/routes/purchase.dart';
import 'package:planify/screens/routes/settings.dart';
import 'package:planify/widgets/editbutton.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ExploreScreen(),
    const InboxScreen(),
    const CalendarScreen(),
    const ProfileScreen(),
    const FavoriteScreen(),
    const PurchaseScreen(),
    const SettingScreen(),
    const AboutUsScreen(),
    const CategoryScreen(),
    const EditButton(),
  ];


   int activeIndex = 0;

  // final List<String> _appBarTitles = const [
  //   'Home',
  //   'Settings',
  //   'Profile',
  //   'Book Screen',
  // ]; // List of titles corresponding to each screen

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  void navigateAndCloseDrawer(BuildContext context, String routeName) {
    if (Scaffold.of(context).isDrawerOpen) {
      Navigator.pop(context); // Close the drawer first
    }
    Navigator.pushNamed(context, routeName);
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: null,
          backgroundColor: Colors.transparent,
          elevation: 0.0, // remove box shadow
          iconTheme:
              const IconThemeData(color:AppColors.accentColor), // recolor the icon
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          backgroundColor: Colors.white,
          color: AppColors.accentColor,
          animationDuration: const Duration(milliseconds: 500),
          items: [
            Icon(
              Icons.explore,
              size: 30.0,
              color: activeIndex == 0 ? Colors.white : AppColors.backgroundColor
            ),
            Icon(
              Icons.message,
              size: 30.0,
              color: activeIndex == 1 ? Colors.white : AppColors.backgroundColor,
            ),
            Icon(
              Icons.calendar_month,
              size: 30.0,
              color: activeIndex == 2 ? Colors.white : AppColors.backgroundColor,
            ),
            Icon(
              Icons.person_2_rounded,
              size: 30.0,
              color: activeIndex == 3 ? Colors.white : AppColors.backgroundColor,
            ),
          ],
          onTap: (index) {
            setState(() {
              activeIndex = index;
            });
          },
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                ),
                child: Text('Planify', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
              ),
              ListTile(
                leading: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/favorite-screen'),
                  child: const Text(
                    'Favorites',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accentColor,
                    ),
                  ),
                ),
              ),
                ListTile(
                leading: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/to-do-screen'),
                  child: const Text(
                    'Schedule',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accentColor,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/about-us-screen'),
                  child: const Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accentColor,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/setting-screen'),
                  child: const Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accentColor,
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        ),
        body: _screens[activeIndex]);
  }
}