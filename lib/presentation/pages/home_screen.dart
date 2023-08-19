import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_wallet/presentation/pages/all_entites_screen.dart';
import 'package:my_wallet/presentation/pages/customer_screen.dart';
import 'package:my_wallet/presentation/pages/merchant_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addCustomer');
              },
              child: const Text('Add Customer'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addMerchant');
              },
              child: const Text('Add Merchant'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MerchantTransactionsScreen(),
                  ),
                );
              },
              child: const Text('Merchant Transactions'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomerTransactionsScreen(),
                  ),
                );
              },
              child: const Text('Customer Transactions'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllEntitiesScreen(),
                  ),
                );
              },
              child: const Text('All Transactions'),
            ),
          ],
        ),
      ),
    );
  }
}

















// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:my_wallet/utils/pdf_invoice_service.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// List<String> status = ['لا شيء', "دائن", "مُدان"];
// bool isExporter = false;

// // class Person {
// //   String name;
// //   num given;
// //   num taken;
// //   Person(`
// //     this.name,
// //     this.given,
// //     this.taken,
// //   );
// // }

// // final PdfInvoiceService service = PdfInvoiceService();
// // List<Person> products = [
// //   Person("أبو أحمد", 9.99, 19),
// //   Person("أم محمود", 0.30, 19),
// // ];
// // int number = 0;

// class _HomeScreenState extends State<HomeScreen> {
//   String dropdownValue = status.first;
//   TextEditingController? searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         floatingActionButton: !isExporter
//             ? FittedBox(
//                 child: FloatingActionButton.extended(
//                   backgroundColor: const Color(0xFF2B3396),
//                   onPressed: () {},
//                   label: const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Row(children: [
//                       Icon(
//                         Icons.add_rounded,
//                         color: Colors.white,
//                         size: 32,
//                       ),
//                       Text(
//                         'إضافة عميل',
//                         style: TextStyle(
//                           fontSize: 24,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                     ]),
//                   ),
//                 ),
//               )
//             : FittedBox(
//                 child: FloatingActionButton.extended(
//                   backgroundColor: const Color(0xFF2B3396),
//                   onPressed: () {},
//                   label: const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Row(children: [
//                       Icon(
//                         Icons.add_rounded,
//                         color: Colors.white,
//                         size: 32,
//                       ),
//                       Text(
//                         'إضافة مورد',
//                         style: TextStyle(
//                           fontSize: 24,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                     ]),
//                   ),
//                 ),
//               ),
//         body: Column(children: [
//           Container(
//             decoration: const BoxDecoration(color: Color(0xFF2B3396)),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const CircleAvatar(
//                         backgroundColor: Colors.white,
//                         child: Icon(
//                           Icons.cloud_done_outlined,
//                           color: Colors.green,
//                         ),
//                       ),
//                       Directionality(
//                         textDirection: TextDirection.rtl,
//                         child: DropdownButton<String>(
//                           value: dropdownValue,
//                           icon: const Icon(
//                             Icons.keyboard_arrow_down_rounded,
//                             color: Colors.white,
//                             size: 46,
//                           ),
//                           elevation: 16,
//                           style: const TextStyle(color: Colors.white),
//                           underline: const SizedBox(),
//                           onChanged: (String? value) {
//                             setState(() {
//                               dropdownValue = value!;
//                             });
//                           },
//                           items: status
//                               .map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(
//                                 value,
//                                 style: const TextStyle(
//                                   fontSize: 32,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           setState(() {
//                             isExporter = !isExporter;
//                           });
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(14),
//                             color: isExporter
//                                 ? Colors.white
//                                 : Colors.white.withOpacity(0.2),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 28.0, vertical: 12),
//                             child: Text(
//                               'مورد',
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 color: isExporter
//                                     ? const Color(0xFF2B3396)
//                                     : Colors.white.withOpacity(0.4),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           setState(() {
//                             isExporter = !isExporter;
//                           });
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(14),
//                             color: isExporter
//                                 ? Colors.white.withOpacity(0.2)
//                                 : Colors.white,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 28.0, vertical: 12),
//                             child: Text(
//                               'عميل',
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 color: isExporter
//                                     ? Colors.white.withOpacity(0.4)
//                                     : const Color(0xFF2B3396),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   !isExporter
//                       ? Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(12)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Column(
//                                   children: [
//                                     Text(
//                                       '١٣٤٧ ج.م',
//                                       style: TextStyle(
//                                         color: Color(0xFF2B3396),
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 24,
//                                       ),
//                                     ),
//                                     Text(
//                                       'عليا',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   width: 40,
//                                 ),
//                                 Container(
//                                   color: Colors.black54,
//                                   height: 50,
//                                   width: 0.5,
//                                 ),
//                                 const SizedBox(
//                                   width: 40,
//                                 ),
//                                 const Column(
//                                   children: [
//                                     Text(
//                                       '١٣٤٧ ج.م',
//                                       style: TextStyle(
//                                         color: Color(0xFF2B3396),
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 24,
//                                       ),
//                                     ),
//                                     Text(
//                                       'اجمالي المشتريات',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       : Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(12)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Column(
//                                   children: [
//                                     Text(
//                                       '١٣٤٧ ج.م',
//                                       style: TextStyle(
//                                         color: Color(0xFF2B3396),
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 24,
//                                       ),
//                                     ),
//                                     Text(
//                                       'عليا',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   width: 40,
//                                 ),
//                                 Container(
//                                   color: Colors.black54,
//                                   height: 50,
//                                   width: 0.5,
//                                 ),
//                                 const SizedBox(
//                                   width: 40,
//                                 ),
//                                 const Column(
//                                   children: [
//                                     Text(
//                                       '١٣٤٧ ج.م',
//                                       style: TextStyle(
//                                         color: Color(0xFF2B3396),
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 24,
//                                       ),
//                                     ),
//                                     Text(
//                                       'مدفوع مقدمًا',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           !isExporter
//               ? Directionality(
//                   textDirection: TextDirection.rtl,
//                   child: TextFormField(
//                     textAlign: TextAlign.right,
//                     textDirection: TextDirection.rtl,
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(
//                         Icons.search_rounded,
//                         size: 32,
//                         color: Colors.grey,
//                       ),
//                       hintText: 'ابحث عن اسم',
//                       hintStyle: const TextStyle(fontSize: 18),
//                       suffixIcon: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           IconButton(
//                             onPressed: () async {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const AgentsReport()));
//                             },
//                             icon: const Icon(
//                               Icons.picture_as_pdf_outlined,
//                               color: Color(0xFF2B3396),
//                               size: 38,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.filter_list_rounded,
//                               color: Color(0xFF2B3396),
//                               size: 38,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     onChanged: (value) {
//                       print(value);
//                     },
//                     onSaved: (String? value) {},
//                     style: const TextStyle(color: Colors.black),
//                   ),
//                 )
//               : Directionality(
//                   textDirection: TextDirection.rtl,
//                   child: TextFormField(
//                     textAlign: TextAlign.right,
//                     textDirection: TextDirection.rtl,
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(
//                         Icons.search_rounded,
//                         size: 32,
//                         color: Colors.grey,
//                       ),
//                       hintText: 'ابحث عن اسم',
//                       hintStyle: const TextStyle(fontSize: 18),
//                       suffixIcon: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           IconButton(
//                             onPressed: () async {
//                               // final data = await service.createHelloWorld();
//                               // service.savePdfFile("invoice_$number", data);
//                               // number++;
//                             },
//                             icon: const Icon(
//                               Icons.picture_as_pdf_outlined,
//                               color: Color(0xFF2B3396),
//                               size: 38,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.filter_list_rounded,
//                               color: Color(0xFF2B3396),
//                               size: 38,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     onChanged: (value) {
//                       print(value);
//                     },
//                     onSaved: (String? value) {},
//                     style: const TextStyle(color: Colors.black),
//                   ),
//                 ),
//           !isExporter
//               ? Expanded(
//                   child: ListView.separated(
//                     itemCount: 10,
//                     separatorBuilder: (context, index) => const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Divider(),
//                     ),
//                     itemBuilder: (context, index) {
//                       return const Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 16.0, vertical: 12),
//                         child: Row(
//                           children: [
//                             Text(
//                               '3700',
//                               style: TextStyle(fontSize: 18),
//                             ),
//                             Spacer(),
//                             Text(
//                               'طاهر كفر الشيخ',
//                               style: TextStyle(fontSize: 20),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             CircleAvatar(
//                               backgroundColor: Color(0xFF2B3396),
//                               child: Text(
//                                 'طك',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 )
//               : Expanded(
//                   child: ListView.separated(
//                     itemCount: 2,
//                     separatorBuilder: (context, index) => const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Divider(),
//                     ),
//                     itemBuilder: (context, index) {
//                       return const Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 16.0, vertical: 12),
//                         child: Row(
//                           children: [
//                             Text(
//                               '6600',
//                               style: TextStyle(fontSize: 18),
//                             ),
//                             Spacer(),
//                             Text(
//                               'Ahmed Fayez',
//                               style: TextStyle(fontSize: 20),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             CircleAvatar(
//                               backgroundColor: Color(0xFF2B3396),
//                               child: Text(
//                                 'AF',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//         ]),
//       ),
//     );
//   }
// }

// class AgentsReport extends StatefulWidget {
//   const AgentsReport({super.key});

//   @override
//   State<AgentsReport> createState() => _AgentsReportState();
// }

// class _AgentsReportState extends State<AgentsReport> {
//   void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
//     print(args.value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Future<void> _showMyDialog() async {
//       return showDialog<void>(
//         context: context,
//         // barrierDismissible: false, // user must tap button!
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text(
//               'اختر الفترة الزمنية',
//               textAlign: TextAlign.right,
//             ),
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: <Widget>[
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.35,
//                     width: MediaQuery.of(context).size.width * 0.75,
//                     child: SfDateRangePicker(
//                       onSelectionChanged: _onSelectionChanged,
//                       selectionMode: DateRangePickerSelectionMode.range,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             actions: [
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: TextButton(
//                   child: const Text('تم'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       );
//     }

//     void _showBottomSheet(BuildContext context) {
//       int selectedRadio = 0;

//       showModalBottomSheet(
//         context: context,
//         builder: (BuildContext context) {
//           return SizedBox(
//             height: MediaQuery.of(context).size.height * 0.35,
//             child: Column(
//               children: <Widget>[
//                 const Padding(
//                   padding: EdgeInsets.only(right: 40.0),
//                   child: Text(
//                     'بحث بواسطة',
//                     style: TextStyle(
//                       fontSize: 32,
//                     ),
//                   ),
//                 ),
//                 Column(
//                   children: <Widget>[
//                     RadioListTile(
//                       title: const Text('الكل'),
//                       value: 1,
//                       groupValue: selectedRadio,
//                       onChanged: (int? value) {
//                         setState(() {
//                           selectedRadio = value!;
//                         });
//                       },
//                     ),
//                     RadioListTile(
//                       title: const Text('الأسبوع الماضي'),
//                       value: 2,
//                       groupValue: selectedRadio,
//                       onChanged: (int? value) {
//                         setState(() {
//                           selectedRadio = value!;
//                         });
//                       },
//                     ),
//                     RadioListTile(
//                       title: const Text('هذا الشهر'),
//                       value: 2,
//                       groupValue: selectedRadio,
//                       onChanged: (int? value) {
//                         setState(() {
//                           selectedRadio = value!;
//                         });
//                       },
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 16,
//                         horizontal: 24,
//                       ),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: const Color(0xFF2B3396),
//                         ),
//                         child: const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Center(
//                             child: Text(
//                               'نتيجة البحث',
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           );
//         },
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(title: const Text('تقرير العملاء')),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     _showMyDialog();
//                   },
//                   child: const Icon(
//                     Icons.date_range_rounded,
//                     size: 34,
//                   ),
//                 ),
//                 const Text(
//                   'مدة التقرير',
//                   style: TextStyle(
//                     fontSize: 24,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     _showBottomSheet(context);
//                   },
//                   child: const Icon(
//                     Icons.filter_list_rounded,
//                     size: 34,
//                   ),
//                 ),
//                 const Text(
//                   'تصفية',
//                   style: TextStyle(
//                     fontSize: 24,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Divider(),
//             const SizedBox(
//               height: 20,
//             ),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   '800 L.E',
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: Colors.red,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'صافي الحساب',
//                   style: TextStyle(
//                     fontSize: 24,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Divider(),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
