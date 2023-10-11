import 'package:bloc/bloc.dart';
import 'package:tugas_bloc/bloc/contact_event.dart';
import 'package:tugas_bloc/models/contact_model.dart';

class ContactBloc extends Bloc<ContactEvent, List<ContactModel>> {
  ContactBloc() : super([]) {
    on<AddContactEvent>((event, emit) {
      final updatedContact = [...state, event.newContact];
      emit(updatedContact);
    });

    on<UpdateContactEvent>((event, emit) {
      final updatedContact = [...state];
      if (event.index >= 0 && event.index < updatedContact.length) {
        updatedContact[event.index] = event.editedContact;
        emit(updatedContact);
      }
    });

    on<DeleteContactEvent>((event, emit) {
      final updatedContact = [...state];
      updatedContact.removeAt(event.index);
      emit(updatedContact);
    });
  }
}
