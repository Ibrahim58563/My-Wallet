// main.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_wallet/data/models/customer.dart';
import 'package:my_wallet/data/models/merchant.dart';
import 'package:my_wallet/data/models/store.dart';
import 'package:my_wallet/data/models/transaction.dart';
import 'package:my_wallet/presentation/pages/add_customer_screen.dart';
import 'package:my_wallet/presentation/pages/add_merchant_screen.dart';
import 'package:my_wallet/presentation/pages/home_screen.dart';

Future<void> clearHiveData() async {
  await Hive.deleteFromDisk();
}

void main() async {
  // await clearHiveData();
  await Hive.initFlutter();
  Hive.registerAdapter(CustomerAdapter());
  Hive.registerAdapter(MerchantAdapter());
  Hive.registerAdapter(StoreAdapter());
  Hive.registerAdapter(TransactionAdapter());

  await Hive.openBox<Customer>('customers');
  await Hive.openBox<Merchant>('merchants');
  await Hive.openBox<Store>('stores');
  await Hive.openBox<Transaction>('transactions');
  runApp(const MyApp());
}

Future<void> clearAllBoxes() async {
  final customerBox = Hive.box<Customer>('customers');
  final merchantBox = Hive.box<Merchant>('merchants');
  final transactionBox = Hive.box<Transaction>('transactions');
  final storeBox = Hive.box<Store>('stores');
  // ... access other boxes ...

  await customerBox.clear();
  await merchantBox.clear();
  await transactionBox.clear();
  await storeBox.clear();
  // ... clear other boxes ...
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/addCustomer': (context) => AddCustomerScreen(),
        '/addMerchant': (context) => const AddMerchantScreen(),
      },
    );
  }
}
