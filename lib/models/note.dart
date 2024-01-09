import 'package:hive_flutter/hive_flutter.dart';
part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  final String text;
  Note({required this.text});
}
