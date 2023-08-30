part of 'transactions_cubit.dart';

@immutable
abstract class TransactionsState {}

class TransactionsInitial extends TransactionsState {}

class getAllTransactionLoadingState extends TransactionsState {}

class getAllTransactionSuccessState extends TransactionsState {}

class getAllTransactionErrorState extends TransactionsState {}

class AddTransactionLoadingState extends TransactionsState {}

class AddTransactionSuccessState extends TransactionsState {}

class addTransactionErrorState extends TransactionsState {}

class LoadingTransactionLoadingState extends TransactionsState {}

class LoadingTransactionSuccessState extends TransactionsState {}

class LoadingTransactionErrorState extends TransactionsState {}
