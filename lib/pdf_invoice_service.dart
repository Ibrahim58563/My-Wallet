// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:io';

// import 'package:flutter/services.dart';
// import 'package:my_wallet/home_screen.dart';
// import 'package:open_document/open_document.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// class CustomRow {
//   final String itemName;
//   final num givenValue;
//   final num takenValue;
//   CustomRow(
//     this.itemName,
//     this.givenValue,
//     this.takenValue,
//   );
// }

// class PdfInvoiceService {
//   Future<dynamic> createHelloWorld() async {
// // final font = await PdfGoogleFonts.nunitoExtraLight();
//     final pdf = pw.Document();
//     pdf.addPage(
//       pw.Page(
//         // pageFormat: PdfPageFormat.letter,
//         build: (pw.Context context) {
//           return pw.Center(
//             child: pw.Text(
//               "Hello World",
//             ),
//           );
//         },
//       ),
//     );
//     return pdf.save();
//   }

//   Future<Uint8List> createInvoice(List<Person> persons) async {
//     final pdf = pw.Document();

//     final List<CustomRow> elements = [
//       CustomRow("Item Name", 20, 50),
//       for (var person in persons)
//         CustomRow(
//           person.name,
//           person.taken,
//           person.given,
//         ),
//       CustomRow(
//         "Sub Total",
//         0,
//         0,
//       ),
//       CustomRow(
//         "Vat Total",
//         0,
//         0,
//       ),
//       CustomRow(
//         "Vat Total",
//         0,
//         (double.parse(getSubTotal(persons)) +
//             double.parse(getVatTotal(persons))),
//       )
//     ];
//     final image = (await rootBundle.load("assets/images/dr_ahmed.jpg"))
//         .buffer
//         .asUint8List();
//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (pw.Context context) {
//           return pw.Column(
//             children: [
//               pw.Image(pw.MemoryImage(image),
//                   width: 150, height: 150, fit: pw.BoxFit.cover),
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Column(
//                     children: [
//                       pw.Text("Person Name"),
//                       pw.Text("Person Address"),
//                       pw.Text("Person City"),
//                     ],
//                   ),
//                   pw.Column(
//                     children: [
//                       pw.Text("Max Weber"),
//                       pw.Text("Weird Street Name 1"),
//                       pw.Text("77662 Not my City"),
//                       pw.Text("Vat-id: 123456"),
//                       pw.Text("Invoice-Nr: 00001")
//                     ],
//                   )
//                 ],
//               ),
//               pw.SizedBox(height: 50),
//               pw.Text(
//                   "Dear Customer, thanks for buying at Flutter Explained, feel free to see the list of items below."),
//               pw.SizedBox(height: 25),
//               itemColumn(elements),
//               pw.SizedBox(height: 25),
//               pw.Text("Thanks for your trust, and till the next time."),
//               pw.SizedBox(height: 25),
//               pw.Text("Kind regards,"),
//               pw.SizedBox(height: 25),
//               pw.Text("Max Weber")
//             ],
//           );
//         },
//       ),
//     );
//     return pdf.save();
//   }

//   pw.Expanded itemColumn(List<CustomRow> elements) {
//     return pw.Expanded(
//       child: pw.Column(
//         children: [
//           for (var element in elements)
//             pw.Row(
//               children: [
//                 pw.Expanded(
//                     child: pw.Text(element.itemName,
//                         textAlign: pw.TextAlign.left)),
//                 pw.Expanded(
//                     child: pw.Text(element.givenValue as String,
//                         textAlign: pw.TextAlign.right)),
//                 pw.Expanded(
//                     child: pw.Text(element.takenValue as String,
//                         textAlign: pw.TextAlign.right)),
//               ],
//             )
//         ],
//       ),
//     );
//   }

//   Future<void> savePdfFile(String fileName, Uint8List byteList) async {
//     final output = await getTemporaryDirectory();
//     var filePath = "${output.path}/$fileName.pdf";
//     final file = File(filePath);
//     await file.writeAsBytes(byteList);
//     await OpenDocument.openDocument(filePath: filePath);
//   }

//   String getSubTotal(List<Person> products) {
//     return "0";
//     // return products
//     //     .fold(0.0,
//     //         (double prev, element) => prev + (element.given * element.taken))
//     //     .toStringAsFixed(2);
//   }

//   String getVatTotal(List<Person> products) {
//     return "0";
//     // return products
//     //     .fold(
//     //       0.0,
//     //       (double prev, next) =>
//     //           prev + ((next.price / 100 * next.vatInPercent) * next.amount),
//     //     )
//     //     .toStringAsFixed(2);
//   }
// }
