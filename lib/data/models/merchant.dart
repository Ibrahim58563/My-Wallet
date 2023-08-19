import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_wallet/data/models/store.dart';
import 'package:my_wallet/data/models/transaction.dart';
part 'merchant.g.dart';

@HiveType(typeId: 1)
class Merchant extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String contactEmail;

  @HiveField(3)
  late String contactPhone;

  @HiveField(4)
  late String address; // New field for merchant address

  @HiveField(5)
  late String pictureUrl; // URL or path to the merchant's picture

  @HiveField(6)
  List<Store> stores = []; // List of stores associated with the merchant

  @HiveField(7)
  List<Transaction> transactions = [];

  double balance = 0;
  double get totalBalance => transactions.fold<double>(
      0, (sum, transaction) => sum + transaction.amount);
  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
    balance += transaction.amount; // Update total balance
  }
}
