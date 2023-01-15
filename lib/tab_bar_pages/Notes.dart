import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager/db/database_provider.dart';

class NoteModel{
  int? id;
  String? title;
  String? body;

  NoteModel({this.id,this.title,this.body});

  Map<String,dynamic> toMap(){
    return({
      'id':id,
      'title':title,
      'body':body,

    });
  }
}

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  getNotes() async {
    final notes = await DatabaseProvider.db.getNotes();
    return notes;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
        future: getNotes(),
        builder: (context,AsyncSnapshot noteData){
          switch(noteData.connectionState){
            case ConnectionState.waiting:{
              return const Center(child: CircularProgressIndicator());
            }
            case ConnectionState.done:
              {
                if(noteData.data == Null){
                  return const Center(child: Text('No Notes,Create them'));
                }else{
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: noteData.data?.length,
                        itemBuilder: (context,index){
                          String title = noteData.data[index]['title'];
                          String body = noteData.data[index]['body'];
                          String id = noteData.data[index]['id'];
                          return Card(child: ListTile(
                            title: Text(title),
                            subtitle: Text(body),
                          ));
                        },
                        ),
                  );
                }
              }
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
          }
          return Center();
        },

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/AddNote');
      },
      child: Icon(Icons.note_add),
      backgroundColor: Colors.black,),
    );


  }
}
