// screens/add_customer_screen.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_wallet/data/models/customer.dart';
import 'package:uuid/uuid.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  _AddCustomerScreenState createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pictureUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: _pictureUrlController,
              decoration: const InputDecoration(labelText: 'Picture URL'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final customerBox = Hive.box<Customer>('customers');
                const uuid = Uuid();
                final uniqueId = uuid.v4();

                final newCustomer = Customer()
                  ..id = uniqueId
                  ..name = _nameController.text
                  ..phone = _phoneController.text;

                customerBox.add(newCustomer);

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
