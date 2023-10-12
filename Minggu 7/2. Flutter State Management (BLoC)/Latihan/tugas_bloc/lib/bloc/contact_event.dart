import 'package:equatable/equatable.dart';
import 'package:tugas_bloc/models/contact_model.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class AddContactEvent extends ContactEvent {
  final ContactModel newContact;

  const AddContactEvent(this.newContact);

  @override
  List<Object> get props => [newContact];
}

class EditContactEvent extends ContactEvent {
  final int index;
  final ContactModel editedContact;

  const EditContactEvent(this.index, this.editedContact);

  @override
  List<Object> get props => [index, editedContact];
}

class DeleteContactEvent extends ContactEvent {
  final int index;

  const DeleteContactEvent(this.index);

  @override
  List<Object> get props => [index];
}

// class UpdateContactEvent extends ContactEvent {
//   final int index;
//   final ContactModel editedContact;

//   const UpdateContactEvent(this.index, this.editedContact);

//   @override
//   List<Object> get props => [index, editedContact];
// }

class UpdateContactEvent extends ContactEvent {
  final List<ContactModel> updatedContacts;

  const UpdateContactEvent(this.updatedContacts);

  @override
  List<Object> get props => [updatedContacts];
}
