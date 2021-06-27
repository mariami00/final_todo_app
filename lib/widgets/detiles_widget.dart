import 'package:final_todo_app/screens/home_screen.dart';
import 'package:final_todo_app/widgets/edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:final_todo_app/data/database.dart';

class DetileWidget extends StatefulWidget {
  const DetileWidget ({Key? key, required this.title,required this.task, required this.description, required this.docId}) : super(key: key);

  final String title;
  final String task;
  final String description;
  final String docId;

  @override
  _DetileWidgetState createState() => _DetileWidgetState();
}

class _DetileWidgetState extends State<DetileWidget> {
  bool isComplet = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        color: Color(0xFF04a3a3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Column(
                  children: [
                    Text(widget.title,style: TextStyle(fontSize: 20, color: Colors.white)),
                    SizedBox(height: 10,),
                    Text(widget.task,style: TextStyle(fontSize: 20, color: Colors.white)),
                    SizedBox(height: 10,),
                    Text(widget.description,style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff6cb4b1)),
                    child: TextButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen())),

                      child: Icon(Icons.check,color: Colors.white,),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff6cb4b1)),
                    child: TextButton(
                      onPressed: () => showModalBottomSheet(context: context, builder: (_) => EditWidget(description: widget.description, task: widget.task, title: widget.title, docId: widget.docId,)),
                      child: Icon(Icons.edit,color: Colors.white,),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff6cb4b1)),
                    child: TextButton(
                      onPressed: () {},

                      child: Icon(Icons.delete,color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: TextButton(

                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("SUBMIT",style: TextStyle(fontSize: 20, color: Color(0xFF04a3a3))),

              ),
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
