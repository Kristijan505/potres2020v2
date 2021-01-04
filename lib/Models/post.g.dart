// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 1;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      contact: fields[7] as String,
      content: fields[2] as String,
      content2: fields[8] as String,
      id: fields[0] as int,
      lat: fields[4] as double,
      lon: fields[3] as double,
      created: fields[5] as DateTime,
      tags: (fields[6] as List)?.cast<Tag>(),
      title: fields[1] as String,
      updated: fields[9] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.lon)
      ..writeByte(4)
      ..write(obj.lat)
      ..writeByte(5)
      ..write(obj.created)
      ..writeByte(6)
      ..write(obj.tags)
      ..writeByte(7)
      ..write(obj.contact)
      ..writeByte(8)
      ..write(obj.content2)
      ..writeByte(9)
      ..write(obj.updated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
