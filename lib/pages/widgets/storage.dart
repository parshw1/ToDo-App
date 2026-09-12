import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/pages/widgets/tasks.dart';

class TaskStorage {
  static const String _tasksKey = 'tasks';

  // Save all tasks
  static Future<void> saveTasks(List<Tasks> tasks) async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> tasksJson = tasks
        .map((task) => jsonEncode(task.toJson()))
        .toList();

    await prefs.setStringList(_tasksKey, tasksJson);
  }

  // Load all tasks
  static Future<List<Tasks>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? tasksJson = prefs.getStringList(_tasksKey);

    if (tasksJson == null) {
      return [];
    }

    return tasksJson
        .map((task) => Tasks.fromJson(jsonDecode(task)))
        .toList();
  }
}