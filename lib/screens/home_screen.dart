import "package:flutter/material.dart";
import "package:planify/components/colors.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          children: [
            Image.asset(
              'assets/images/home.jpg', // Replace with your image path
              width: 320,
              height: 300,
              fit: BoxFit.cover
            ),
            const SizedBox(height: 20.0), // Add spacing between image and button
            ElevatedButton(
              onPressed: () {
                // Handle button press (navigation to dashboard)
                Navigator.pushNamed(context, '/dashboard-screen'); // Replace '/dashboard' with your actual route name
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50), backgroundColor: AppColors.accentColor, // Set button color
              ),
              child: const Text('Go to Dashboard', style:TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textColor,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
