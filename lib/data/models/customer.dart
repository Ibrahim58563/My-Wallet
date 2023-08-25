import 'package:hive/hive.dart';
import 'package:my_wallet/data/models/transaction.dart';
part 'generated_hive_model.dart/customer.g.dart';

@HiveType(typeId: 2)
class Customer {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String phone; // Phone number of the customer

  // @HiveField(3)
  // List<Transaction> transactions = [];

  // // double balance = 0;
  // double get totalBalance => transactions.fold<double>(
  //     0, (sum, transaction) => sum + (transaction.amount * transaction.price));
  // void addTransaction(Transaction transaction) {
  //   transactions.add(transaction);
  //   // balance += (transaction.amount * transaction.price); // Update total balance
  // }
}
