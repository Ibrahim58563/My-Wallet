import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_wallet/presentation/pages/add_merchant_screen.dart';
import 'package:my_wallet/presentation/pages/add_transaction.dart';
import 'package:my_wallet/presentation/pages/merchant_details_screen.dart';

class MerchantListScreen extends StatelessWidget {
  const MerchantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   appBar: AppBar(title: const Text('Merchant List')),
        //   body:
        Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('merchants').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final merchants = snapshot.data!.docs;
          List<Widget> merchantWidgets = [];
          for (var merchant in merchants) {
            final merchantId = merchant.id;
            final merchantName = merchant['name'];
            final merchantContactPhone = merchant['contactPhone'];
            final merchantAddress = merchant['address'];
            final merchantBalance = merchant['balance'];

            merchantWidgets.add(
              ListTile(
                title: Text(merchantName),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(merchantContactPhone),
                    Text(merchantAddress),
                    Text(merchantBalance.toString()),
                  ],
                ),
                onTap: () {
                  // Navigate to merchant detail screen with merchantId
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MerchantDetailScreen(
                                merchantId: merchantId,
                              )));
                },
              ),
            );
          }
          return ListView(
            children: merchantWidgets,
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => AddMerchantScreen()));
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
