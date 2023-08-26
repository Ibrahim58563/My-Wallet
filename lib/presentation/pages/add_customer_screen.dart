import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  _AddCustomerScreenState createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Customer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name')),
            TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone')),
            ElevatedButton(
              onPressed: () async {
                final customersCollection =
                    FirebaseFirestore.instance.collection('customers');
                await customersCollection.add({
                  'name': _nameController.text,
                  'phone': _phoneController.text,
                  'balance': 0.0,
                });
                Navigator.pop(context);
              },
              child: const Text('Add Customer'),
            ),
          ],
        ),
      ),
    );
  }
}
