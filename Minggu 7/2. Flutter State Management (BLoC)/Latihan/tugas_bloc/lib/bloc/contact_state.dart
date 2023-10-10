import 'package:equatable/equatable.dart';
import 'package:tugas_bloc/models/contact_model.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoadSuccessState extends ContactState {
  final List<ContactModel> contacts;

  const ContactLoadSuccessState({required this.contacts});

  @override
  List<Object> get props => [contacts];
}
