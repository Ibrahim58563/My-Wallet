// screens/merchant_transactions_screen.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/data/models/merchant.dart';
import 'package:my_wallet/data/models/transaction.dart';
import 'package:my_wallet/presentation/pages/add_transaction.dart';

class MerchantTransactionsScreen extends StatelessWidget {
  const MerchantTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final merchantBox = Hive.box<Merchant>('merchants');
    final transactionBox = Hive.box<Transaction>('transactions');

    return Expanded(
      child: ListView.builder(
        itemCount: merchantBox.length,
        itemBuilder: (context, index) {
          final merchant = merchantBox.getAt(index);
          final merchantTransactions = transactionBox.values
              .where(
                (transaction) => transaction.merchantId == merchant?.id,
              )
              .toList();
          final totalBalance = merchantTransactions.fold<double>(
              0,
              (sum, transaction) =>
                  sum + (transaction.amount * transaction.price));

          return ListTile(
            title: Text('Merchant: ${merchant?.name}'),
            subtitle:
                Text('Total Balance: \$${totalBalance.toStringAsFixed(2)}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MerchantDetailScreen(
                    merchant: merchant!,
                    transactions: merchantTransactions,
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

class MerchantDetailScreen extends StatelessWidget {
  final Merchant merchant;
  final List<Transaction> transactions;

  const MerchantDetailScreen(
      {super.key, required this.merchant, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(merchant.name),
      ),
      body: Column(
        children: [
          // Inside the MerchantDetailScreen

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${transactions[index].name}'),
                      Text('Store: ${transactions[index].storeName}'),
                      Text('Type: ${transactions[index].type}'),
                      Text(
                          'Time: ${DateFormat('HH:mm yyyy-MM-dd').format(DateTime.parse(transactions[index].timestamp))}'),
                      Text(
                          'Amount: ${transactions[index].amount.toStringAsFixed(2)}'),
                      Text(
                          'Price: ${((transactions[index].price) * (transactions[index].amount)).toStringAsFixed(2)}'),
                      Text('Description: ${transactions[index].description}'),
                      Text('Note: ${transactions[index].note}'),
                    ],
                  ),
                );
              },
            ),
          ),
          // Text('Total Balance: \$${merchant.totalBalance.toStringAsFixed(2)}'),
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
          // const Text('Stores:', style: TextStyle(fontWeight: FontWeight.bold)),
          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: merchant.stores.length,
          //   itemBuilder: (context, index) {
          //     final store = merchant.stores[index];
          //     return ListTile(
          //       title: Text(store.name),
          //       subtitle: Text('Location: ${store.location}'),
          //       // ... display other store information ...
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
