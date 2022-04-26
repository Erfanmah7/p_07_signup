import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:p_07_singup/models/user.dart';
import 'package:p_07_singup/screens/list_user.dart';

void main() async{
  Hive.registerAdapter(userAdapter());
  await Hive.initFlutter();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListUser(),
    ),
  );
}

