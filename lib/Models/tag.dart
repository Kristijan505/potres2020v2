import 'package:hive/hive.dart';

part 'tag.g.dart';

@HiveType(typeId: 2)
class Tag {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String tag;

  @HiveField(2)
  final String description;

  Tag({
    this.description,
    this.id,
    this.tag,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'] ?? 0,
      description: json['description'] ?? '',
      tag: json['tag'] ?? '',
    );
  }
}
