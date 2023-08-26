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
        '/addCustomer': (context) => AddCustomerScreen(),
        '/addMerchant': (context) => AddMerchantScreen(),
      },
    );
  }
}
