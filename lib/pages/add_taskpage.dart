import 'package:flutter/material.dart';

class AddTaskpage extends StatefulWidget {
  const new({super.key});

  @override
  State<AddTaskpage> createState() => _AddTaskpageState();
}

class _AddTaskpageState extends State<AddTaskpage> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _taskDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Task',
          style: TextStyle(fontWeight: FontWeight(500), fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              child: Icon(Icons.playlist_add, size: 50, color: Colors.grey),
            ),
            SizedBox(height: 60),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: Text('Task Title',
                  style: TextStyle(
                    fontSize: 17
                  ),),
                ),
              ],
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Eg. Buy Groceries',
                      hintStyle: TextStyle(
                        color: Colors.grey
                      )
                    ),
                  ),
                ],
              )
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: Text('Task Description',
                  style: TextStyle(
                    fontSize: 17
                  ),),
                ),
              ],
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: _taskDescriptionController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Eg. Buy essential groceries for the week, including vegetables, fruits, milk, bread, eggs, and other household items.',
                      hintStyle: TextStyle(
                        color: Colors.grey
                      )
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
