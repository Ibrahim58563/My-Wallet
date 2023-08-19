import 'package:hive/hive.dart';
part 'store.g.dart';

@HiveType(typeId: 0)
class Store extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name; // New field: Name of the store

  @HiveField(2)
  late String location; // New field: Location of the store

  @HiveField(3)
  late String phoneNumber; // New field: Phone number of the store
  @HiveField(4)
  late String field;
}
