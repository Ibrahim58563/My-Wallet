import 'package:my_wallet/data/models/transaction.dart';

class Customer {
  late String id;
  late String name;
  late String phone;
  List<Transaction> transactions = [];

  double get totalBalance => transactions.fold<double>(
      0, (sum, transaction) => sum + (transaction.amount * transaction.price));
  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }
}
