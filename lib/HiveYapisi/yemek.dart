import 'package:hive/hive.dart';

part 'yemek.g.dart';

@HiveType(typeId: 1)
class Yemek {
  Yemek(
      {required this.name,
      required this.countryFrom,
      required this.time,
      required this.ingredients});
  @HiveField(0)
  String name;

  @HiveField(1)
  String countryFrom;

  @HiveField(2)
  int time;

  @HiveField(3)
  List<String> ingredients;
}
