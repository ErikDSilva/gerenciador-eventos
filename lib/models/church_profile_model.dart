import 'package:hive/hive.dart';
import 'event_model.dart';

part 'church_profile_model.g.dart';

@HiveType(typeId: 0)
class ChurchProfile extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  int iconCodePoint;

  @HiveField(2)
  List<Event> events;

  ChurchProfile({
    required this.title,
    required this.iconCodePoint,
    required this.events,
  });
}