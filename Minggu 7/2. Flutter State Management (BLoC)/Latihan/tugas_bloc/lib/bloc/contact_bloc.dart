import 'package:bloc/bloc.dart';
import 'package:tugas_bloc/bloc/contact_event.dart';
import 'package:tugas_bloc/models/contact_model.dart';

class ContactBloc extends Bloc<ContactEvent, List<ContactModel>> {
  ContactBloc() : super([]) {
    on<AddContactEvent>((event, emit) {
      final updatedContacts = [...state, event.newContact];
      emit(updatedContacts);
    });

    // on<EditContactEvent>((event, emit) {
    //   final updatedContacts = [...state];
    //   updatedContacts[event.index] = event.editedContact;
    //   emit(updatedContacts);
    // });

    on<UpdateContactEvent>((event, emit) {
      // final updatedContacts = [...state];
      // updatedContacts[event.index] = event.editedContact;
      emit(event.updatedContacts);
    });

    on<DeleteContactEvent>((event, emit) {
      final updatedContacts = [...state];
      updatedContacts.removeAt(event.index);
      emit(updatedContacts);
    });
  }
}