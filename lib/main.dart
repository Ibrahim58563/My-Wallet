// main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_wallet/data/models/customer.dart';
import 'package:my_wallet/data/models/merchant.dart';
import 'package:my_wallet/data/models/store.dart';
import 'package:my_wallet/data/models/transaction.dart';
import 'package:my_wallet/firebase_options.dart';
import 'package:my_wallet/presentation/pages/add_customer_screen.dart';
import 'package:my_wallet/presentation/pages/add_merchant_screen.dart';
import 'package:my_wallet/presentation/pages/home_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.initFlutter(appDocumentDirectory.path);
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/addCustomer': (context) => const AddCustomerScreen(),
        '/addMerchant': (context) => const AddMerchantScreen(),
      },
    );
  }

  // In your main.dart
  @override
  void dispose() {
    Hive.box<Customer>('customers').close();
    Hive.box<Merchant>('merchants').close();
    Hive.box<Store>('stores').close();
    Hive.box<Transaction>('transactions').close();
    Hive.close(); // Close the Hive instance
    super.dispose();
  }
}
