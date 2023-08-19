// screens/merchant_transactions_screen.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_wallet/data/models/merchant.dart';
import 'package:my_wallet/presentation/pages/add_transaction.dart';

class MerchantTransactionsScreen extends StatelessWidget {
  const MerchantTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final merchantBox = Hive.box<Merchant>('merchants');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Merchant Transactions'),
      ),
      body: ListView.builder(
        itemCount: merchantBox.length,
        itemBuilder: (context, index) {
          final merchant = merchantBox.getAt(index);
          final transactions = merchant!.transactions;
          final totalBalance = merchant.totalBalance;

          return ListTile(
            title: Text('Merchant: ${merchant.name}'),
            subtitle:
                Text('Total Balance: \$${totalBalance.toStringAsFixed(2)}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MerchantDetailScreen(merchant),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MerchantDetailScreen extends StatelessWidget {
  final Merchant merchant;

  const MerchantDetailScreen(this.merchant, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(merchant.name),
      ),
      body: Column(
        children: [
          // Inside the MerchantDetailScreen
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddTransactionScreen(merchant: merchant),
                ),
              );
            },
            child: const Text('Add Transaction'),
          ),

          Text('Total Balance: \$${merchant.totalBalance.toStringAsFixed(2)}'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: merchant.transactions.length,
            itemBuilder: (context, index) {
              final transaction = merchant.transactions[index];
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amount: ${transaction.amount.toStringAsFixed(2)}'),
                    Text('Name: ${transaction.name}'),
                    Text('Price: ${transaction.price.toStringAsFixed(2)}'),
                    Text('Description: ${transaction.description}'),
                    Text('Note: ${transaction.note}'),
                  ],
                ),
              );
            },
          ),
          const Text('Stores:', style: TextStyle(fontWeight: FontWeight.bold)),
          ListView.builder(
            shrinkWrap: true,
            itemCount: merchant.stores.length,
            itemBuilder: (context, index) {
              final store = merchant.stores[index];
              return ListTile(
                title: Text(store.name),
                subtitle: Text('Location: ${store.location}'),
                // ... display other store information ...
              );
            },
          ),
        ],
      ),
    );
  }
}
