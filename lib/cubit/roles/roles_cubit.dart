import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'roles_state.dart';

class RolesCubit extends Cubit<RolesState> {
  RolesCubit() : super(RolesInitial());
}
