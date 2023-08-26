import 'package:hive/hive.dart';
import 'package:my_wallet/data/models/customer.dart';
import 'package:my_wallet/data/models/merchant.dart';

class Transaction {
  late String id;
  String timestamp = DateTime.now().toString();
  late double amount;
  late String type; // "Sale" or "Purchase"
  late String storeName; // Name of the store associated with the transaction
  Customer? customer; // Optional linked customer
  Merchant? merchant; // Optional linked merchant
  late String pictureUrl; // URL or path to the transaction picture
  late String name; // Name of the transaction
  late double price; // Price of the transaction
  late String description; // Description of the transaction
  late String note; // Additional notes for the transaction
  late String? customerId;
  late String? merchantId;
}
