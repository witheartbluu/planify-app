import 'package:flutter/material.dart';
import 'package:planify/components/chat.dart';
import 'package:planify/widgets/messages.dart';


class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  void goToAnotherRoute(context, screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
    // Navigator.pushNamed(context, '/second-screen');
    // Navigator.pushNamed(context, '/third-screen');
    // Navigator.pushNamed(context, '/custom-screen');
  }

  @override
  Widget build(BuildContext context) {
    // return const Center(
    //   child: Text('Navigate to Screen Profile'),
    // );
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
           title: const Text(
            "Inbox",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'INBOX'),
                Tab(text: 'GENERAL'),
                Tab(text: 'ARCHIVED'),
                // Tab(icon: Icon(Icons.directions_car)),
                // Tab(icon: Icon(Icons.directions_transit)),
                // Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              const Messages(),
              const Icon(Icons.directions_transit),
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                TextButton(
                  onPressed: () =>
                      goToAnotherRoute(context, const ChatScreen()),
                  child: const Text('Go to Second Screen'),
                ),
                SizedBox(height: 15, width: 15),
                TextButton(
                  onPressed: () =>
                      goToAnotherRoute(context, const ChatScreen()),
                  child: const Text('Go to Third Screen'),
                ),
                SizedBox(height: 15, width: 15),
                TextButton(
                  onPressed: () =>
                      goToAnotherRoute(context, const ChatScreen()),
                  child: const Text('Go to Custom Screen'),
                ),
              ])
              // Center(
              //   child: TextButton(
              //     onPressed: () =>
              //         goToAnotherRoute(context, const SecondScreen()),
              //     child: const Text('Go to Second Screen'),

              //   ),
              // ),
            ],
          ),
        ));
  }
}