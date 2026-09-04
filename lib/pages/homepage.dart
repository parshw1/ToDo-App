import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const new({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool searching = false;
  final TextEditingController _searchInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: searching 
        ? TextField(
          controller: _searchInput,
          autocorrect: true,
        ):null,
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                searching = !searching;
              });
              if(!searching){
                _searchInput.clear();
              }
            }, 
            icon: Icon(Icons.search))
        ],
      ),
      drawer: Drawer(
        shadowColor: Colors.black,
      ),
    );
  }
}