import 'package:flutter/material.dart';

class Unplanned extends StatefulWidget {
  @override
  _UnplannedState createState() => _UnplannedState();
}

class _UnplannedState extends State<Unplanned> {
  final List<String> _tasks = [];
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task List"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return Dismissible(
                  key: Key(task),
                  onDismissed: (direction) {
                    setState(() {
                      _tasks.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title: Text(task),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _taskController,
              decoration: InputDecoration(
                hintText: "Add a new task",
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _tasks.add(_taskController.text);
            _taskController.clear();
          });
        },
        child: Icon(Icons.add,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class Unplanned extends StatefulWidget {
//   const Unplanned({Key? key}) : super(key: key);
//
//   @override
//   State<Unplanned> createState() => _UnplannedState();
// }
//
// class _UnplannedState extends State<Unplanned> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Unplanned'),
//     );
//   }
// }
