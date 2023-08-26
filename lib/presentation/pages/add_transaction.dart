import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTransactionScreen extends StatefulWidget {
  final String customerId;
  final String merchantId;

  const AddTransactionScreen(
      {super.key, required this.customerId, required this.merchantId});

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _storeNameController = TextEditingController();
  final TextEditingController _pictureUrlController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Add Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name')),
            TextField(
                controller: _storeNameController,
                decoration: const InputDecoration(labelText: 'Store Name')),
            TextField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number),
            // TextField(
            //     controller: _typeController,
            //     decoration: const InputDecoration(labelText: 'Type')),

            // TextField(
            //     controller: _pictureUrlController,
            //     decoration: const InputDecoration(labelText: 'Picture URL')),

            TextField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number),
            TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description')),
            TextField(
                controller: _noteController,
                decoration: const InputDecoration(labelText: 'Note')),
            ElevatedButton(
              onPressed: () async {
                final transactionsCollection =
                    FirebaseFirestore.instance.collection('transactions');
                await transactionsCollection.add({
                  'name': _nameController.text,
                  'amount': double.parse(_amountController.text),
                  'type': _typeController.text,
                  'storeName': _storeNameController.text,
                  'pictureUrl': _pictureUrlController.text,
                  'price': double.parse(_priceController.text),
                  'description': _descriptionController.text,
                  'note': _noteController.text,
                  'timestamp': FieldValue.serverTimestamp(),
                  'customerId': widget.customerId,
                  'merchantId': widget.merchantId,
                  'totalBalance': double.parse(_amountController.text) *
                      double.parse(_priceController.text)
                });
                if (widget.customerId.isNotEmpty) {
                  // Update customer's balance in Firestore
                  await FirebaseFirestore.instance
                      .collection('customers')
                      .doc(widget.customerId)
                      .update({
                    'balance': FieldValue.increment(
                        double.parse(_amountController.text) *
                            double.parse(_priceController.text)),
                  });
                } else if (widget.merchantId.isNotEmpty) {
                  // Update merchant's balance in Firestore
                  await FirebaseFirestore.instance
                      .collection('merchants')
                      .doc(widget.merchantId)
                      .update({
                    'balance': FieldValue.increment(
                        double.parse(_amountController.text) *
                            double.parse(_priceController.text)),
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
