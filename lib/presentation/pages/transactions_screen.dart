// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class TransactionForm extends StatefulWidget {
//   final String customerId; // Pass the customer ID if applicable
//   final String merchantId; // Pass the merchant ID if applicable

//   const TransactionForm(
//       {super.key, required this.customerId, required this.merchantId});

//   @override
//   _TransactionFormState createState() => _TransactionFormState();
// }

// class _TransactionFormState extends State<TransactionForm> {
//   double _amount = 0.0;
//   String _type = 'Sale'; // Default selection
//   String _storeName = ''; // Initialize with empty string
//   String _pictureUrl = ''; // Initialize with empty string
//   String _name = ''; // Initialize with empty string
//   double _price = 0.0; // Initialize with 0.0
//   String _description = ''; // Initialize with empty string
//   String _note = ''; // Initialize with empty string

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           onChanged: (value) {
//             setState(() {
//               _amount = double.tryParse(value) ?? 0.0;
//             });
//           },
//           decoration: const InputDecoration(labelText: 'Amount'),
//           keyboardType: TextInputType.number,
//         ),
//         DropdownButton<String>(
//           value: _type,
//           onChanged: (newValue) {
//             setState(() {
//               _type = newValue!;
//             });
//           },
//           items: ['Sale', 'Purchase'].map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         ),
//         TextField(
//           onChanged: (value) {
//             setState(() {
//               _storeName = value;
//             });
//           },
//           decoration: const InputDecoration(labelText: 'Store Name'),
//         ),
//         TextField(
//           onChanged: (value) {
//             setState(() {
//               _pictureUrl = value;
//             });
//           },
//           decoration: const InputDecoration(labelText: 'Picture URL'),
//         ),
//         TextField(
//           onChanged: (value) {
//             setState(() {
//               _name = value;
//             });
//           },
//           decoration: const InputDecoration(labelText: 'Name'),
//         ),
//         TextField(
//           onChanged: (value) {
//             setState(() {
//               _price = double.tryParse(value) ?? 0.0;
//             });
//           },
//           decoration: const InputDecoration(labelText: 'Price'),
//           keyboardType: TextInputType.number,
//         ),
//         TextField(
//           onChanged: (value) {
//             setState(() {
//               _description = value;
//             });
//           },
//           decoration: const InputDecoration(labelText: 'Description'),
//         ),
//         TextField(
//           onChanged: (value) {
//             setState(() {
//               _note = value;
//             });
//           },
//           decoration: const InputDecoration(labelText: 'Note'),
//         ),
//         ElevatedButton(
//           onPressed: () async {
//             // Create a new transaction object and save it to Firestore
//             var transactionData = {
//               'customerId': widget.customerId,
//               'merchantId': widget.merchantId,
//               'amount': _amount,
//               'type': _type,
//               'storeName': _storeName,
//               'pictureUrl': _pictureUrl,
//               'name': _name,
//               'price': _price,
//               'description': _description,
//               'note': _note,
//               'totalBalance': _amount * _price,
//             };

//             await FirebaseFirestore.instance
//                 .collection('transactions')
//                 .add(transactionData);

//             if (widget.customerId.isNotEmpty) {
//               // Update customer's balance in Firestore
//               await FirebaseFirestore.instance
//                   .collection('customers')
//                   .doc(widget.customerId)
//                   .update({
//                 'balance': (_amount * _price),
//               });
//             } else if (widget.merchantId.isNotEmpty) {
//               // Update merchant's balance in Firestore
//               await FirebaseFirestore.instance
//                   .collection('merchants')
//                   .doc(widget.merchantId)
//                   .update({
//                 'balance': (_amount * _price),
//               });
//             }

//             Navigator.pop(context); // Close the form after adding transaction
//           },
//           child: const Text('Add Transaction'),
//         ),
//       ],
//     );
//   }
// }
