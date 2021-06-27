import 'package:final_todo_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:final_todo_app/data/database.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/todo.png"),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColorDark),
                  borderRadius: BorderRadius.circular(18),
                  color: Theme.of(context).primaryColorDark,
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  controller: _textEditingController,
                ),
              ),
              SizedBox(height: 40,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColorDark),
                  borderRadius: BorderRadius.circular(18),
                  color: Theme.of(context).primaryColorDark,
                ),
                child: TextButton(
                  onPressed: () {
                    Database.userID=_textEditingController.text;
                    Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text("login",style: TextStyle(fontSize: 25, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}