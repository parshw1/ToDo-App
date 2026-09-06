import 'package:flutter/material.dart';
import 'package:to_do_app/pages/add_taskpage.dart';
import 'package:to_do_app/pages/widgets/tasks.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool searching = false;
  final TextEditingController _searchInput = TextEditingController();
  List<Tasks> tasks = [];
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
      body: tasks.isNotEmpty
          ? ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];

                return Card(
                  child: ListTile(
                    leading: Checkbox(
                      value: task.isCompleted,
                      onChanged: (value) {
                        setState(() {
                          task.isCompleted = value ?? false;
                        });
                      },
                    ),
                    title: Text(task.title),
                    subtitle: Text(task.description),
                  ),
                );
              },
            )
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
        onPressed: () async {
          final addedtask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => AddTaskpage()),
          );
          if (addedtask != null) {
            setState(() {
              tasks.add(addedtask);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.work), label: "Tasks"),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
