// screens/all_entities_screen.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_wallet/data/models/customer.dart';
import 'package:my_wallet/data/models/merchant.dart';
import 'package:my_wallet/presentation/pages/customer_screen.dart';
import 'package:my_wallet/presentation/pages/merchant_screen.dart';

class AllEntitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customerBox = Hive.box<Customer>('customers');
    final merchantBox = Hive.box<Merchant>('merchants');

    return Scaffold(
      appBar: AppBar(
        title: Text('All Entities'),
      ),
      body: ListView.builder(
        itemCount: customerBox.length + merchantBox.length,
        itemBuilder: (context, index) {
          if (index < customerBox.length) {
            final customer = customerBox.getAt(index);
            return ListTile(
              title: Text('Customer: ${customer!.name}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerDetailScreen(customer),
                  ),
                );
              },
            );
          } else {
            final merchant = merchantBox.getAt(index - customerBox.length);
            return ListTile(
              title: Text('Merchant: ${merchant!.name}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MerchantDetailScreen(merchant),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
