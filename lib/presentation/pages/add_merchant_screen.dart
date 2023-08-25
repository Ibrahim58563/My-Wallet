// screens/add_merchant_screen.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_wallet/data/models/store.dart';
import '../../data/models/merchant.dart';
import 'package:uuid/uuid.dart';

class AddMerchantScreen extends StatefulWidget {
  const AddMerchantScreen({super.key});

  @override
  _AddMerchantScreenState createState() => _AddMerchantScreenState();
}

class _AddMerchantScreenState extends State<AddMerchantScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pictureUrlController = TextEditingController();
  final TextEditingController _storeNameController = TextEditingController();
  final TextEditingController _storeLocationController =
      TextEditingController();
  final TextEditingController _storePhoneNumberController =
      TextEditingController();
  final TextEditingController _fieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Merchant'),
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
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _pictureUrlController,
              decoration: const InputDecoration(labelText: 'Picture Url'),
            ),
            TextField(
              controller: _storeNameController,
              decoration: const InputDecoration(labelText: 'Store Name'),
            ),
            TextField(
              controller: _storeLocationController,
              decoration: const InputDecoration(labelText: 'Store Location'),
            ),
            TextField(
              controller: _storePhoneNumberController,
              decoration:
                  const InputDecoration(labelText: 'Store Phone Number'),
            ),
            TextField(
              controller: _fieldController,
              decoration: const InputDecoration(labelText: 'Field'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final merchantBox = Hive.box<Merchant>('merchants');
                const uuid = Uuid();
                final uniqueId = uuid.v4();

                final newMerchant = Merchant()
                  ..id = uniqueId
                  ..name = _nameController.text
                  ..contactPhone = _phoneController.text
                  ..address = _addressController.text;

                merchantBox.add(newMerchant);

                Navigator.pop(context);
              },
              child: const Text('Add Merchant'),
            ),
          ],
        ),
      ),
    );
  }
}
