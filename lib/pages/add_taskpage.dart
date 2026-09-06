import 'package:flutter/material.dart';
import 'package:to_do_app/pages/widgets/tasks.dart';

class AddTaskpage extends StatefulWidget {
  final Tasks? task;
  const AddTaskpage({super.key, this.task});

  @override
  State<AddTaskpage> createState() => _AddTaskpageState();
}

class _AddTaskpageState extends State<AddTaskpage> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _taskDescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      _taskController.text = widget.task!.title;
      _taskDescriptionController.text = widget.task!.description;
    }
  }

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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5,
                  ),
                  child: Text('Task Title', style: TextStyle(fontSize: 17)),
                ),
              ],
            ),
            Card(
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Eg. Buy Groceries',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5,
                  ),
                  child: Text(
                    'Task Description (Optional)',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
            Card(
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: _taskDescriptionController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Eg. Buy essential groceries for the week, including vegetables, fruits, milk, bread, eggs, and other household items.',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 70),
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  final addedtask = Tasks(
                    id: widget.task?.id??DateTime.now().millisecondsSinceEpoch.toString(),
                    title: _taskController.text,
                    description: _taskDescriptionController.text,
                    isCompleted: widget.task?.isCompleted??false,
                  );
                  Navigator.pop(context, addedtask);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 8,
                ),
                child: Text("Add Task", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
