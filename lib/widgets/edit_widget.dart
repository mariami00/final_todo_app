import 'package:flutter/material.dart';
import 'package:final_todo_app/data/database.dart';

class EditWidget extends StatefulWidget {
  EditWidget({Key? key, required this.title, required this.task, required this.description, required this.docId}) : super(key: key);

  final String title;
  final String task;
  final String description;
  final String docId;

  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  late TextEditingController _titleController;
  late TextEditingController _taskController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _taskController = TextEditingController(text: widget.task);
    _descriptionController = TextEditingController(text: widget.description);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        color: Color(0xFF04a3a3),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: double.infinity,
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(hintText: 'please enter title', hintStyle: TextStyle(color: Colors.white)),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(width: double.infinity,
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _taskController,
                  decoration: InputDecoration(hintText: 'please enter task', hintStyle: TextStyle(color: Colors.white)),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(width: double.infinity,
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(hintText: 'please enter description', hintStyle: TextStyle(color: Colors.white)),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: () {
                    Database.updateItem(title: _titleController.text,task: _taskController.text, description: _descriptionController.text, docId: widget.docId);
                    Navigator.pop(context);
                  },
                  child: Text("EDIT",style: TextStyle(fontSize: 20, color: Color(0xFF04a3a3))),
                ),
              ),
              SizedBox(height: 250,),
            ],
          ),
        ),
      ),
    );
  }
}
