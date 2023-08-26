import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMerchantScreen extends StatefulWidget {
  @override
  _AddMerchantScreenState createState() => _AddMerchantScreenState();
}

class _AddMerchantScreenState extends State<AddMerchantScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactPhoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Merchant')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _contactPhoneController, decoration: InputDecoration(labelText: 'Contact Phone')),
            TextField(controller: _addressController, decoration: InputDecoration(labelText: 'Address')),
            ElevatedButton(
              onPressed: () async {
                final merchantsCollection = FirebaseFirestore.instance.collection('merchants');
                await merchantsCollection.add({
                  'name': _nameController.text,
                  'contactPhone': _contactPhoneController.text,
                  'address': _addressController.text,
                  'balance': 0.0,
                });
                Navigator.pop(context);
              },
              child: Text('Add Merchant'),
            ),
          ],
        ),
      ),
    );
  }
}
