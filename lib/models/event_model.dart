import 'package:hive/hive.dart';

part 'event_model.g.dart';

@HiveType(typeId: 1) 
class Event extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String date;

  @HiveField(2)
  String description;

  Event({
    required this.name,
    required this.date,
    required this.description,
  });
}