import 'package:flutter/material.dart';
import 'package:to_do_app/pages/add_taskpage.dart';

class Homepage extends StatefulWidget {
  const new({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool searching = false;
  bool isTaskGenerated = false;
  final TextEditingController _searchInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: searching
            ? TextField(controller: _searchInput, autocorrect: true)
            : null,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                searching = !searching;
              });
              if (!searching) {
                _searchInput.clear();
              }
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(shadowColor: Colors.black),
      body: isTaskGenerated
          ? null
          : Center(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No Task Available",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Create a Task using the Icon below",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (BuildContext context) => AddTaskpage()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
    );
  }
}
