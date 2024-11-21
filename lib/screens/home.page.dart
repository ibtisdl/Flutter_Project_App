import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          "HomePage",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage("images/avatar.png"),
                    radius: 30,
                  ),
                  Text(
                    "Ibtissam Saadali",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "ibtissamsaadali@gmail.com",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Covid Tracker'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.indigo[900],
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Emsi Chatbot'),
              onTap: () {},
            ),
            Divider(
              color: Colors.indigo[900],
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {},
            ),
            Divider(
              color: Colors.indigo[900],
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.indigo[900],
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.indigo[900],
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Welcome to the home Page",
          style: TextStyle(fontSize: 40, color: Colors.indigo),
        ),
      ),
    );
  }
}
