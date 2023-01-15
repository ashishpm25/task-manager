import 'package:flutter/material.dart';
import 'package:task_manager/db/database_provider.dart';
import 'package:task_manager/tab_bar_pages/Notes.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {

  String? title;
  String? body;
  DateTime? date ;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();


  addNote(NoteModel note){
    DatabaseProvider.db.addNewNote(note);
    print('Note added Succesfully');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfff0ecec),
        title: Text('Add New Note'),
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title'
              ),
              style: TextStyle(fontSize: 28.0,
              fontWeight: FontWeight.bold),
            ),
            Expanded(child: TextField(
              controller: bodyController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Your Note'
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        setState(() {
          title = titleController.text;
          body = bodyController.text;
          date = DateTime.now();
        });
        NoteModel note = NoteModel(title: title,body: body);
        addNote(note);
        Navigator.pushNamedAndRemoveUntil(context,'/',(route)=>false);
      },
          label: Text('Save'),
          icon: Icon(Icons.save),
      ),
    );
  }
}
