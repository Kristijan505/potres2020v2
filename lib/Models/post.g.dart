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
      longDesc: fields[8] as String,
      id: fields[0] as int,
      lat: fields[4] as double,
      lon: fields[3] as double,
      created: fields[5] as DateTime,
      tags: (fields[6] as List)?.cast<Tag>(),
      title: fields[1] as String,
      updated: fields[9] as DateTime,
      conclusion: fields[10] as String,
      imageId: fields[11] as String,
      waterConnection: (fields[12] as List)?.cast<String>(),
      electricConnection: (fields[13] as List)?.cast<String>(),
      image2Id: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(15)
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
      ..write(obj.longDesc)
      ..writeByte(9)
      ..write(obj.updated)
      ..writeByte(10)
      ..write(obj.conclusion)
      ..writeByte(11)
      ..write(obj.imageId)
      ..writeByte(12)
      ..write(obj.waterConnection)
      ..writeByte(13)
      ..write(obj.electricConnection)
      ..writeByte(14)
      ..write(obj.image2Id);
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
