import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_todo_app/data/database.dart';

class AddNewScreen extends StatelessWidget {
  AddNewScreen({Key? key}) : super(key: key);

  TextEditingController _titleController = TextEditingController();
  TextEditingController _taskController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
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
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextButton(
                  onPressed: () {
                    Database.addItem(title: _titleController.text, task: _taskController.text, description: _descriptionController.text);
                    Navigator.pop(context);
                  },
                  child: Text("SUBMIT",style: TextStyle(fontSize: 20, color: Color(0xFF04a3a3))),
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