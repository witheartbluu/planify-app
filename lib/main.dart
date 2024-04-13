import 'package:flutter/material.dart';
import 'package:planify/screens/dashboard_screen.dart';
import 'package:planify/screens/home_screen.dart';
import 'package:planify/screens/pages/profile.dart';
import 'package:planify/screens/routes/category.dart';
import 'package:planify/screens/routes/editprofile.dart';
import 'package:planify/screens/routes/profile_eo.dart';
import 'package:planify/screens/routes/aboutus.dart';
// import 'package:planify/screens/pages/explore.dart';
// import 'package:planify/screens/pages/inbox.dart';
import 'package:planify/screens/routes/favorites.dart';
import 'package:planify/screens/routes/notif.dart';
import 'package:planify/screens/routes/purchase.dart';
import 'package:planify/screens/routes/settings.dart';
import 'package:planify/screens/routes/todo_screen.dart';
// import 'package:planify/screens/dashboard_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planify',
      home: const Home(),
      theme: ThemeData(
        fontFamily: "Poppins",
        useMaterial3: true,
      ),
      initialRoute: "/",
      onGenerateRoute: _onGenerateRoute,
      routes: {
        '/favorite-screen': (context) => const FavoriteScreen(),
        '/purchase-screen': (context) => const PurchaseScreen(),
        '/setting-screen': (context) => const SettingScreen(),
        '/profile-screen': (context) => const ProfileScreen(),
        '/notif-screen': (context) => const NotifScreen(),
        '/to-do-screen': (context) => const ToDoScreen(),
        '/about-us-screen': (context) => const AboutUsScreen(),
        '/eo-screen': (context) => const EditProfileScreen(),
        '/edit-profile-screen': (context) => const EOScreen(),
        '/category-screen': (context) => const CategoryScreen(),
        '/dashboard-screen': (context) => const Dashboard(title: 'Dashboard',),
      },
    );
  }
}



Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const Dashboard(title: 'Dashboard Here',);
      });
    case "/dashboard":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const Home();
      });
  default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return const Home();
      });
  }
}