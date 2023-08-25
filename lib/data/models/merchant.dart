import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_wallet/data/models/transaction.dart';
part 'generated_hive_model.dart/merchant.g.dart';

@HiveType(typeId: 1)
class Merchant {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String contactPhone;

  @HiveField(3)
  late String address; // New field for merchant address

  // @HiveField(4)
  // List<Transaction> transactions = [];

  // double balance = 0;
  // double get totalBalance => transactions.fold<double>(
  //     0, (sum, transaction) => sum + (transaction.amount * transaction.price));
  // void addTransaction(Transaction transaction) {
  //   transactions.add(transaction);
  //   balance += (transaction.amount * transaction.price); // Update total balance
  // }
}
