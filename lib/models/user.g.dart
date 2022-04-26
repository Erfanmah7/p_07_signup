// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class userAdapter extends TypeAdapter<user> {
  @override
  final int typeId = 1;

  @override
  user read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return user()
      ..fn = fields[0] as String
      ..ln = fields[1] as String
      ..em = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, user obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.fn)
      ..writeByte(1)
      ..write(obj.ln)
      ..writeByte(2)
      ..write(obj.em);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is userAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
