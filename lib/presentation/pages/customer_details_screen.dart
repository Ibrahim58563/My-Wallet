import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/presentation/pages/add_transaction.dart';
import 'package:my_wallet/presentation/pages/transactions_screen.dart';

class CustomerDetailScreen extends StatelessWidget {
  final String customerId;

  const CustomerDetailScreen(this.customerId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Customer Detail')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('customers')
            .doc(customerId)
            .snapshots(),
        builder: (context, customerSnapshot) {
          if (!customerSnapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final customerData = customerSnapshot.data;

          // Fetch customer's transactions
          return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('transactions')
                .where('customerId', isEqualTo: customerId)
                .snapshots(),
            builder: (context, transactionsSnapshot) {
              if (!transactionsSnapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final transactions = transactionsSnapshot.data!.docs;

              final customerName = customerData!['name'];
              final customerPhone = customerData['phone'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: $customerName'),
                  Text('Phone: $customerPhone'),
                  // Display customer's transactions
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

                        print(time);
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
                                customerId: customerId, merchantId: ''),
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
