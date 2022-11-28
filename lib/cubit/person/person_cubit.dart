import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  PersonCubit() : super(PersonInitial());
}
