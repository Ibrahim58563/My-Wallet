import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_wallet/presentation/pages/add_customer_screen.dart';
import 'package:my_wallet/presentation/pages/customer_details_screen.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    // Scaffold(
    //   appBar: AppBar(title: const Text('Customer List')),
    //   body: 
      
      Expanded(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('customers').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            final customers = snapshot.data!.docs;
            List<Widget> customerWidgets = [];
            for (var customer in customers) {
              final customerId = customer.id;
              final customerName = customer['name'];
              final customerPhone = customer['phone'];
              customerWidgets.add(
                ListTile(
                  title: Text(customerName),
                  subtitle: Text(customerPhone),
                  onTap: () {
                    // Navigate to customer detail screen with customerId
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CustomerDetailScreen(customerId)));
                  },
                ),
              );
            }
            return ListView(
              children: customerWidgets,
            );
          },
        ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => AddCustomerScreen()));
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
