// // screens/all_entities_screen.dart
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:my_wallet/data/models/customer.dart';
// import 'package:my_wallet/data/models/merchant.dart';
// import 'package:my_wallet/presentation/pages/customer_screen.dart';
// import 'package:my_wallet/presentation/pages/merchant_screen.dart';

// class AllEntitiesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final customerBox = Hive.box<Customer>('customers');
//     final merchantBox = Hive.box<Merchant>('merchants');
//     final transactionBox = Hive.box<Transaction>('transactions');

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('All Entities'),
//       ),
//       body: ListView.builder(
//         itemCount: customerBox.length + merchantBox.length,
//         itemBuilder: (context, index) {
//           if (index < customerBox.length) {
//             final customer = customerBox.getAt(index);
//             final customerTransactions = transactionBox.values.where(
//               (transaction) => transaction.customerId == customer!.id,
//             ).toList();
//             final totalBalance = customerTransactions.fold<double>(
//               0, (sum, transaction) => sum + (transaction.amount * transaction.price),
//             );

//             return ListTile(
//               title: Text('Customer: ${customer.name}'),
//               subtitle: Text('Total Balance: \$${totalBalance.toStringAsFixed(2)}'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CustomerDetailScreen(
//                       customer: customer,
//                       transactions: customerTransactions,
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else {
//             final merchant = merchantBox.getAt(index - customerBox.length);
//             final merchantTransactions = transactionBox.values.where(
//               (transaction) => transaction.merchantId == merchant!.id,
//             ).toList();
//             final totalBalance = merchantTransactions.fold<double>(
//               0, (sum, transaction) => sum + (transaction.amount * transaction.price),
//             );

//             return ListTile(
//               title: Text('Merchant: ${merchant.name}'),
//               subtitle: Text('Total Balance: \$${totalBalance.toStringAsFixed(2)}'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MerchantDetailScreen(
//                       merchant: merchant,
//                       transactions: merchantTransactions,
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
