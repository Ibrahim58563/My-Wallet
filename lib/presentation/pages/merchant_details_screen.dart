import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/presentation/pages/add_transaction.dart';
import 'package:my_wallet/presentation/pages/transactions_screen.dart';

class MerchantDetailScreen extends StatelessWidget {
  final String merchantId;

  const MerchantDetailScreen({super.key, required this.merchantId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Merchant Details')),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('merchants')
            .doc(merchantId)
            .snapshots(),
        builder: (context, merchantSnapshot) {
          if (!merchantSnapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final merchantData = merchantSnapshot.data;

          // Fetch merchant's transactions
          return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('transactions')
                .where('merchantId', isEqualTo: merchantId)
                .snapshots(),
            builder: (context, transactionsSnapshot) {
              if (!transactionsSnapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final transactions = transactionsSnapshot.data!.docs;

              final merchantName = merchantData!['name'];
              final merchantContactPhone = merchantData['contactPhone'];
              final merchantAddress = merchantData['address'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: $merchantName'),
                  Text('Contact Phone: $merchantContactPhone'),
                  Text('Address: $merchantAddress'),
                  // Display merchant's transactions
                  const Text('Transactions:'),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
                        final transactionName = transaction['name'];
                        final totalPrice = transaction['totalBalance'];
                        final amount = transaction['amount'];
                        final itemPrice = transaction['price'];
                        final storeName = transaction['storeName'];
                        final time = DateFormat('dd-MM-yy HH:mm:ss')
                            .format((transaction['timestamp']).toDate());

                        // Display transaction details
                        return ListTile(
                          title: Text('Item Name: $transactionName'),
                          subtitle: Column(
                            children: [
                              Text('Store Name: $storeName'),
                              Text('Item price: $itemPrice'),
                              Text('Amount: $amount'),
                              Text('Time: $time'),
                              Text('Total Price: $totalPrice'),
                            ],
                          ),
                          // Display more transaction details as needed
                        );
                      },
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddTransactionScreen(
                                customerId: '', merchantId: merchantId),
                          ),
                        );
                      },
                      child: const Text('Add Transaction'),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
