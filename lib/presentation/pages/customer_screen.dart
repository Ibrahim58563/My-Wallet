// screens/customer_transactions_screen.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_wallet/data/models/customer.dart';
import 'package:my_wallet/presentation/pages/add_transaction.dart';

class CustomerTransactionsScreen extends StatelessWidget {
  const CustomerTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customerBox = Hive.box<Customer>('customers');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Transactions'),
      ),
      body: ListView.builder(
        itemCount: customerBox.length,
        itemBuilder: (context, index) {
          final customer = customerBox.getAt(index);
          final transactions = customer!.transactions;
          final totalBalance = customer.totalBalance;

          return ListTile(
            title: Text('Customer: ${customer.name}'),
            subtitle:
                Text('Total Balance: \$${totalBalance.toStringAsFixed(2)}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerDetailScreen(customer),
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

  const CustomerDetailScreen(this.customer, {super.key});

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

          Text('Total Balance: \$${customer.totalBalance.toStringAsFixed(2)}'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: customer.transactions.length,
            itemBuilder: (context, index) {
              final transaction = customer.transactions[index];
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amount: ${transaction.amount.toStringAsFixed(2)}'),
                    Text('Store: ${transaction.storeName}'),
                    Text('Name: ${transaction.name}'),
                    Text('Price: ${transaction.price.toStringAsFixed(2)}'),
                    Text('Description: ${transaction.description}'),
                    Text('Note: ${transaction.note}'),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
