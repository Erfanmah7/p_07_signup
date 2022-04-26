import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId :1)
class user{

  @HiveField(0)
  String fn;

  @HiveField(1)
  String ln;

  @HiveField(2)
  String em;



}