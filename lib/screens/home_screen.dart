import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_todo_app/widgets/add_new_widget.dart';
import 'package:final_todo_app/widgets/detiles_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_todo_app/data/database.dart';
import 'package:google_fonts/google_fonts.dart';



class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 bool isComplet = false;

 final style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("TODO APP",style: GoogleFonts.roboto( textStyle: style)),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF04a3a3)),
                        child: TextButton(
                          onPressed: () => showModalBottomSheet(context: context, builder: (_) => AddNewScreen()),

                          child: Icon(Icons.add,color: Colors.white,),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                color: Color(0xff6cb4b1),
                child: StreamBuilder<QuerySnapshot>(
                  stream: Database.readItems(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("opps! error");
                    } else if (snapshot.hasData || snapshot.data != null) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            String title = snapshot.data!.docs[index].get("title");
                            String task = snapshot.data!.docs[index].get("task");
                            String docId = snapshot.data!.docs[index].id;
                            String description = snapshot.data!.docs[index].get("description");
                            return Card(
                              child: ListTile(
                                onTap: () => showModalBottomSheet(context: context, builder: (_) => DetileWidget(description: description, task: task, title: title, docId: docId,)),
                                onLongPress: () {
                                  setState(() {
                                    isComplet = !isComplet;
                                  });
                                },
                                title: Text(title),
                                subtitle: Text(task),
                                trailing: Container(
                                  padding: EdgeInsets.all(2),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: isComplet? Colors.grey: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child:Icon(Icons.check,color: Colors.white,),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(height: 5,),
                          itemCount: snapshot.data!.docs.length);
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
          ),
        ],
      ),
    );
  }
}