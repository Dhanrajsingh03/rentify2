import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // List to hold notifications
  List<NotificationModel> notifications = [
    NotificationModel(
      title: 'New Message',
      message: 'You have a new message from John.',
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
    ),
    NotificationModel(
      title: 'Reminder',
      message: 'Your meeting is in 30 minutes.',
      timestamp: DateTime.now().subtract(Duration(hours: 1)),
    ),
    NotificationModel(
      title: 'App Update Available',
      message: 'A new update is available for the app.',
      timestamp: DateTime.now().subtract(Duration(hours: 3)),
    ),
  ];

  // Function to simulate adding a new notification
  void _addNotification() {
    setState(() {
      notifications.insert(
        0,
        NotificationModel(
          title: 'New Notification',
          message: 'This is a new notification added.',
          timestamp: DateTime.now(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            weight: 20.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Notifications  ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationCard(notification: notification);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNotification,
        child: Icon(Icons.add),
      ),
    );
  }
}

// A widget for displaying a single notification
class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          notification.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.message),
            SizedBox(height: 4),
            Text(
              '${notification.timestamp.hour}:${notification.timestamp.minute}',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationModel {
  final String title;
  final String message;
  final DateTime timestamp;

  NotificationModel({
    required this.title,
    required this.message,
    required this.timestamp,
  });
}
