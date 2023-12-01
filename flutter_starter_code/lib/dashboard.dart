import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_starter_code/profile.dart';

class Dashboard extends StatefulWidget {
  final String username;
  const Dashboard({super.key, required this.username});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> names = <String>[
    "Savings",
    "Current",
    "Fixed Deposit",
    "Nominated",
    "Personal"
  ];
  List<String> _saved_items = ["Savings", "Current"];

  @override
  Widget build(BuildContext context) {
    // dropdown menu only show unsaved accounts
    List<String> options =
        names.toSet().difference(_saved_items.toSet()).toList();
    String dropdownValue;

    if (options.isEmpty) {
      dropdownValue = "";
    } else {
      dropdownValue = options.first;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dashboard'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FittedBox(
                child: Row(
              children: [
                const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: badges.Badge(
                      badgeContent: Text('10'),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.grey,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  child: Text(
                    greeting(),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 82, 62, 44)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    widget.username,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.amber),
                  ),
                ),
                GestureDetector(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                      child: Image(
                          width: 50,
                          height: 50,
                          image: AssetImage("assets/images/avatar.jpg")),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profile(
                                  username: widget.username,
                                )),
                      );
                    }),
              ],
            )),
            Container(
              height: 20,
              width: 300,
              child: SearchBar(
                leading: Icon(Icons.search),
              ),
            ),
            ElevatedButton(
                child: const Text('+'),
                onPressed: () {
                  //show popup-dropdown
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                            title: const Text("Add another account"),
                            content: Container(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                  StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return DropdownButton<String>(
                                      value: dropdownValue,
                                      elevation: 16,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 53, 49, 61)),
                                      onChanged: (String? value) {
                                        setState(() {
                                          dropdownValue = value!;
                                        });
                                      },
                                      items: options
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    );
                                  }),
                                  ElevatedButton(
                                    style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll<
                                              Color>(
                                          Color.fromARGB(255, 117, 212, 238)),
                                    ),
                                    child: Text(
                                        dropdownValue == "" ? 'Close' : "Save"),
                                    onPressed: () {
                                      setState(() {
                                        if (dropdownValue != "") {
                                          _saved_items.add(dropdownValue);
                                        }
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      });
                                    },
                                  )
                                ])));
                      });
                }),
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: _saved_items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        margin: EdgeInsets.all(2),
                        color: Color.fromARGB(255, 155, 214, 242),
                        child: Center(
                            child: Text(
                          '${_saved_items.reversed.toList()[index]}',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 251, 249, 249),
                              fontFamily: 'Roboto'),
                        )),
                      );
                    }))
          ],
        ),
      ),
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning!';
    }
    if (hour < 17) {
      return 'Good Afternoon!';
    }
    return 'Good Evening!';
  }
}
