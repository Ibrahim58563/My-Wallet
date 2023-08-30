part of 'customer_cubit.dart';

@immutable
abstract class CustomerState {}

class CustomerInitial extends CustomerState {}

class getAllCustomersLoadingState extends CustomerState {}

class getAllCustomersSuccessState extends CustomerState {}

class getAllCustomersErrorState extends CustomerState {}

class addCustomerLoadingState extends CustomerState {}

class addCustomerSuccessState extends CustomerState {
  String UserId;
  addCustomerSuccessState(this.UserId);
}

class addCustomerErrorState extends CustomerState {}

class DeleteCustomerSuccessState extends CustomerState {}

class DeleteCustomerLoadingState extends CustomerState {}

class DeleteCustomerErrorState extends CustomerState {}
