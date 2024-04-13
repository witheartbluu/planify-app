import "package:flutter/material.dart";
import "package:planify/widgets/profileinfo.dart";
import "package:planify/widgets/editbutton.dart"; // Assuming editbutton.dart defines the EditButtonScreen widget

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/share-screen'),
              icon: const Icon(Icons.share),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () => Navigator.pushNamed(context, '/setting-screen'),
          icon: const Icon(Icons.settings),
        ),
      ),
      body: const ProfileInfo(),
      floatingActionButton: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditButton()),
        ),
        child: const Text('Edit Profile'),
      ),
    );
  }
}
