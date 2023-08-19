import 'package:hive/hive.dart';
import 'package:my_wallet/data/models/customer.dart';
import 'package:my_wallet/data/models/merchant.dart';
part 'transaction.g.dart';

@HiveType(typeId: 3)
class Transaction extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String timestamp;

  @HiveField(2)
  late double amount;

  @HiveField(3) 
  late String type; // "Sale" or "Purchase"

  @HiveField(4)
  late String storeName; // Name of the store associated with the transaction

  @HiveField(5)
  Customer? customer; // Optional linked customer

  @HiveField(6)
  Merchant? merchant; // Optional linked merchant

  @HiveField(7)
  late String pictureUrl; // URL or path to the transaction picture

  @HiveField(8)
  late String name; // Name of the transaction

  @HiveField(9)
  late double price; // Price of the transaction

  @HiveField(10)
  late String description; // Description of the transaction

  @HiveField(11)
  late String note; // Additional notes for the transaction

  // Transaction({
  //   required this.id,
  //   required this.timestamp,
  //   required this.amount,
  //   required this.type,
  //   required this.storeName,
  //   this.customer,
  //   this.merchant,
  //   required this.pictureUrl,
  //   required this.name,
  //   required this.price,
  //   required this.description,
  //   required this.note,
  // });
}
