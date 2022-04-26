import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:p_07_singup/models/user.dart';
import 'package:p_07_singup/screens/singup.dart';

class ListUser extends StatefulWidget {
  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('List User'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: loadData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return ListViewBuilder();
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SingUp()));
        },
        child: Icon(Icons.login),
      ),
    );
  }

  Widget ListViewBuilder() {
    Box userBox = Hive.box('user');
    return ValueListenableBuilder(
      valueListenable: userBox.listenable(),
      builder: (BuildContext context, Box box, _) {
        if (box.values.isEmpty) {
          return Center(
            child: Text('not is found'),
          );
        } else {
          return ListView.builder(
            itemCount: userBox.length,
            itemBuilder: (BuildContext context, int index) {
              user userindex = box.getAt(index);
              return Card(
                child: ListTile(
                  title: Text(
                      'First name: ${userindex.fn}  , Last name: ${userindex.ln} , Email: ${userindex.em}'),
                  trailing: IconButton(
                    onPressed: () {
                      remov(index);
                    },
                    icon: Icon(Icons.highlight_remove),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  Future<Box> loadData() {
    return Hive.openBox('user');
  }

  remov(int index){

    Box userbo = Hive.box('user');
    userbo.deleteAt(index);

  }

}
