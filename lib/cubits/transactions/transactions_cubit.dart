import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(TransactionsInitial());

  static TransactionsCubit get(context) => BlocProvider.of(context);

  addTransaction(double price, String description, String time,
      String customerId, String merchantId) async {
    emit(AddTransactionLoadingState());
    final transactionsCollection =
        FirebaseFirestore.instance.collection('transactions');
    await transactionsCollection.add({
      'name': "name",
      'price': price,
      'description': description,
      'timestamp': time,
      'customerId': customerId,
      'merchantId': merchantId,
    }).then((value) async {
      if (customerId.isNotEmpty) {
        // Update customer's balance in Firestore
        await FirebaseFirestore.instance
            .collection('customers')
            .doc(customerId)
            .update({
          'balance': FieldValue.increment(price),
        });
      } else if (merchantId.isNotEmpty) {
        // Update merchant's balance in Firestore
        await FirebaseFirestore.instance
            .collection('merchants')
            .doc(merchantId)
            .update({
          'balance': FieldValue.increment(price),
        });
      }
      print("heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeer");
      emit(AddTransactionSuccessState());
    }).catchError((error) {
      print("wwwwwwwwwwwwwwwwwwww$error");
      emit(addTransactionErrorState());
    });
  }

  List transactions = [];
  double forMe = 0;
  double forYou = 0;
  double balance = 0;
  getAllCustomerTransaction(String userId) {
    transactions.clear();
    forMe = 0;
    forYou = 0;
    balance = 0;
    emit(getAllTransactionLoadingState());
    FirebaseFirestore.instance
        .collection('transactions')
        .orderBy("timestamp", descending: true)
        .where('customerId', isEqualTo: userId)
        .get()
        .then((value) {
      for (var element in value.docs) {
        print("dddddddddddddddd${element.data()['price']}");

        if (element.data()['price'] < 0) {
          forMe += element.data()['price'];
        } else {
          forYou += element.data()['price'];
        }
        transactions.add(element.data());
      }
      balance = forYou + forMe;
      emit(getAllTransactionSuccessState());
    }).catchError((onError) {
      emit(getAllTransactionErrorState());
    });
  }

  getAllMerchantTransaction(String userId) {
    transactions.clear();
    forMe = 0;
    forYou = 0;
    balance = 0;
    emit(getAllTransactionLoadingState());
    FirebaseFirestore.instance
        .collection('transactions')
        .orderBy("timestamp", descending: true)
        .where('merchantId', isEqualTo: userId)
        .get()
        .then((value) {
      for (var element in value.docs) {
        if (element.data()['price'] < 0) {
          forMe += element.data()['price'];
        } else {
          forYou += element.data()['price'];
        }
        transactions.add(element.data());
      }
      balance = forYou + forMe;
      emit(getAllTransactionSuccessState());
    }).catchError((onError) {
      emit(getAllTransactionErrorState());
    });
  }

  Future<void> deleteTransactionByAttributes(
      double price, String customerId, String merchantId) async {
    emit(LoadingTransactionLoadingState());

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('transactions')
          .where('price', isEqualTo: price)
          .where('customerId', isEqualTo: customerId)
          .where('merchantId', isEqualTo: merchantId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final transactionDocRef = querySnapshot.docs.first.reference;
        await transactionDocRef.delete();

        if (customerId.isNotEmpty) {
          await FirebaseFirestore.instance
              .collection('customers')
              .doc(customerId)
              .update({
            'balance': FieldValue.increment(-price),
          });
        } else if (merchantId.isNotEmpty) {
          await FirebaseFirestore.instance
              .collection('merchants')
              .doc(merchantId)
              .update({
            'balance': FieldValue.increment(-price),
          });
        }

        emit(LoadingTransactionSuccessState());
      } else {
        emit(LoadingTransactionErrorState());
      }
    } catch (error) {
      emit(LoadingTransactionErrorState());
    }
  }
}
