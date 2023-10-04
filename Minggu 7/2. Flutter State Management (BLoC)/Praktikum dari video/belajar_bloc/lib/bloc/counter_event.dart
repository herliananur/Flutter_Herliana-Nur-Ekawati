import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

//untuk menambah nilai
class Increment extends CounterEvent {}

//untuk mengurangi nilai
class Decrement extends CounterEvent {}
