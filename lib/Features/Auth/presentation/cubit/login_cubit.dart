import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/local_data/shared_pref_helper.dart';
import '../../../../core/utils/strings.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  void login(String email, String password) {
    emit(LoginLoading());

    Future.delayed(Duration(seconds: 2), () async {
      if (email == 'test@example.com' && password == 'password') {
        emit(LoginSuccess(
          'Login successful! Welcome, $email',
        ));
        await SharedPrefsHelper.saveBool(Strings.isUserLogged);
      } else {
        emit(LoginError('Invalid credentials'));
      }
    });
  }
}
