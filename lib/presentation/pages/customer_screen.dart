// screens/customer_transactions_screen.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_wallet/data/models/customer.dart';
import 'package:my_wallet/data/models/transaction.dart';
import 'package:my_wallet/presentation/pages/add_transaction.dart';

class CustomerTransactionsScreen extends StatelessWidget {
  const CustomerTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customerBox = Hive.box<Customer>('customers');
    final transactionBox = Hive.box<Transaction>('transactions');

    return Expanded(
      child: ListView.builder(
        itemCount: customerBox.length,
        itemBuilder: (context, index) {
          final customer = customerBox.getAt(index);
          final customerTransactions = transactionBox.values
              .where(
                (transaction) => transaction.customerId == customer!.id,
              )
              .toList();
          final totalBalance = customerTransactions.fold<double>(
              0,
              (sum, transaction) =>
                  sum + (transaction.amount * transaction.price));

          return ListTile(
            title: Text('Customer: ${customer?.name}'),
            subtitle:
                Text('Total Balance: \$${totalBalance.toStringAsFixed(2)}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerDetailScreen(
                    customer: customer!,
                    transactions: customerTransactions,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CustomerDetailScreen extends StatelessWidget {
  final Customer customer;
  final List<Transaction> transactions;

  const CustomerDetailScreen(
      {super.key, required this.customer, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(customer.name),
      ),
      body: Column(
        children: [
          // Inside the CustomerDetailScreen
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddTransactionScreen(customer: customer),
                ),
              );
            },
            child: const Text('Add Transaction'),
          ),

          // Text('Total Balance: \$${customer.totalBalance.toStringAsFixed(2)}'),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amount: ${transaction.amount.toStringAsFixed(2)}'),
                      Text('Store: ${transaction.storeName}'),
                      Text('Name: ${transaction.name}'),
                      Text(
                          'Price: ${((transactions[index].price) * (transactions[index].amount)).toStringAsFixed(2)}'),
                      Text('Description: ${transaction.description}'),
                      Text('Note: ${transaction.note}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
