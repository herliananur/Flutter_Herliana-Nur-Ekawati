import 'package:equatable/equatable.dart';
import 'package:tugas_bloc/models/contact_model.dart';

// part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class AddContactEvent extends ContactEvent {
  final ContactModel contact;

  const AddContactEvent(this.contact);

  @override
  List<Object> get props => [contact];
}

class RemoveContactEvent extends ContactEvent {
  final int index;

  const RemoveContactEvent(this.index);

  @override
  List<Object> get props => [index];
}

class UpdateContactEvent extends ContactEvent {
  final int index;
  final ContactModel contact;

  const UpdateContactEvent(this.index, this.contact);

  @override
  List<Object> get props => [index, contact];
}
