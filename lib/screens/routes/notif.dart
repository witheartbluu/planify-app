import 'package:flutter/material.dart';

class NotifScreen extends StatelessWidget {
  const NotifScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
      ),
      body: ListView.builder(
        itemCount: _notifications.length, // Assuming you have a list of notifications
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return NotificationItem(notification: notification); // Create a NotificationItem widget
        },
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final Notification notification;

  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.notifications),
      title: Text(notification.title),
      subtitle: Text(notification.body),
      onTap: () {
        // Handle notification tap (optional)
        // You can navigate to another screen or perform an action
      },
    );
  }
}

// Assuming you have a model class for Notification
class Notification {
  final String title;
  final String body;

  Notification({required this.title, required this.body});
}

// Replace this with your actual notification data
List<Notification> _notifications = [
  Notification(title: "Event Update", body: "Your event has been rescheduled."),
  Notification(title: "New Message", body: "You have a new message from John."),
  // Add more notifications as needed
];
