import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem("UFRPE", "18h", "www.ufrpe.br"),
    NotificationItem("UFPE", "19h", "www.ufpe.br"),
    NotificationItem("UFPB", "20h", "www.ufpb.br"),
    NotificationItem("UFRJ", "21h", "www.ufrj.br"),
    NotificationItem("USP", "22h", "www.usp.br"),
    NotificationItem("INEP", "23h", "www.inep.gov.br"),
    NotificationItem("IBGE", "08h", "www.ibge.gov.br"),
    NotificationItem("SBIE", "09h", "www.sbie.org.br"),
    NotificationItem("UFABC", "10h", "www.ufabc.edu.br"),
    NotificationItem("UFMG", "11h", "www.ufmg.br"),
    NotificationItem("UFSC", "12h", "www.ufsc.br"),
    NotificationItem("UNB", "13h", "www.unb.br"),
    NotificationItem("UNICAMP", "14h", "www.unicamp.br"),
    NotificationItem("PUCRS", "15h", "www.pucrs.br"),
    NotificationItem("UFES", "16h", "www.ufes.br"),
    NotificationItem("UFF", "17h", "www.uff.br"),
    NotificationItem("UFSM", "18h", "www.ufsm.br"),
    NotificationItem("UFPR", "19h", "www.ufpr.br"),
    NotificationItem("UFRGS", "20h", "www.ufrgs.br"),
    NotificationItem("UFOP", "21h", "www.ufop.br"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return NotificationCard(notifications[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String time;
  final String url;

  NotificationItem(this.title, this.time, this.url);
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  NotificationCard(this.notification);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: Colors.orange, width: 2.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Icon(Icons.notifications, color: Colors.orange),
        title: Text(
          notification.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.time),
            Text(notification.url, style: TextStyle(color: Colors.orange)),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationsScreen(),
    theme: ThemeData(
      primarySwatch: Colors.orange,
    ),
  ));
}
