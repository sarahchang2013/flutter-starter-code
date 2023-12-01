import 'package:flutter/material.dart';
import 'package:flutter_starter_code/main.dart';

class Profile extends StatefulWidget {
  final String username;
  const Profile({super.key, required this.username});
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Profile'),
        ),
        body: Column(
          children: [
            Row(children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  child: Text(
                    "First Name",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 103, 99, 99)),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  child: Text(
                    // replace by row fetched from database with username
                    widget.username.split('_')[0],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )),
            ]),
            Row(children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  child: Text(
                    "Last Name",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 103, 99, 99)),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  child: Text(
                    // replace by row fetched from database with username
                    widget.username.split('_')[1],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )),
            ]),
            Row(children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  child: Text(
                    "Phone Number",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 103, 99, 99)),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  child: Text(
                    // replace by row fetched from database with username
                    widget.username.length.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )),
            ]),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Login(title: 'Login')),
                );
              },
              child: const Text('Log out'),
            )
          ],
        ));
  }
}
