import 'package:hive/hive.dart';
import 'package:my_wallet/data/models/transaction.dart';
part 'customer.g.dart';

@HiveType(typeId: 2)
class Customer extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String address;

  @HiveField(3)
  late String email;

  @HiveField(4)
  late String phone; // Phone number of the customer

  @HiveField(5)
  late String pictureUrl; // URL or path to the customer's picture

  @HiveField(6)
  List<Transaction> transactions = [];

  double balance = 0;
  double get totalBalance => transactions.fold<double>(
      0, (sum, transaction) => sum + transaction.amount);
  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
    balance += transaction.amount; // Update total balance
  }
}
