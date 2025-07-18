import 'package:bloc/bloc.dart';
import 'package:sahel/features/auth/presentation/manager/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
}
