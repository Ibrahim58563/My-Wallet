// screens/add_transaction_screen.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_wallet/data/models/customer.dart';
import 'package:my_wallet/data/models/merchant.dart';
import 'package:my_wallet/data/models/transaction.dart';
import 'package:uuid/uuid.dart';

class AddTransactionScreen extends StatefulWidget {
  final Customer? customer;
  final Merchant? merchant;

  const AddTransactionScreen({super.key, this.customer, this.merchant});

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _storeNameController = TextEditingController();
  final TextEditingController _pictureUrlController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _storeNameController,
              decoration: const InputDecoration(labelText: 'Store Name'),
            ),
            TextField(
              controller: _pictureUrlController,
              decoration: const InputDecoration(labelText: 'Picture URL'),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(labelText: 'Note'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final transactionBox = Hive.box<Transaction>('transactions');
                const uuid = Uuid();
                final uniqueId = uuid.v4();

                double? amountValue = double.tryParse(_amountController.text);
                if (amountValue != null) {
                  final currentTimestamp =
                      DateTime.now().toString(); // Keep it as String

                  // Successfully parsed the amount as a double
                  final newTransaction = Transaction()
                    ..id = uniqueId
                    ..timestamp = currentTimestamp
                    ..amount = amountValue
                    ..type = 'Sale' // Or 'Purchase'
                    ..storeName = _storeNameController.text
                    ..pictureUrl = _pictureUrlController.text
                    ..name = _nameController.text
                    ..merchant = widget.merchant
                    ..customer = widget.customer
                    ..price = double.parse(_priceController.text)
                    ..description = _descriptionController.text
                    ..note = _noteController.text
                    ..customerId = widget.customer?.id
                    ..merchantId = widget.merchant?.id;

                  transactionBox.add(newTransaction);
                  await transactionBox.compact();

                  Navigator.pop(context);
                }
              },
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
