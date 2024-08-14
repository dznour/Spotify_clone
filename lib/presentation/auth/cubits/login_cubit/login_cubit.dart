import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../data/models/auth/signin_user_req.dart';
import '../../../../domain/use_cases/auth/signin_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> userLogin(String email, String password) async {
    emit(LoginLoading());
    final SigninUserReq user = SigninUserReq(email: email, password: password);
    var result = await sl<SigninUsecase>().call(params: user);
    result.fold((error) {
      log("err");
      emit(LoginError(error));
    }, (success) {
      log("succ");
      emit(LoginSuccess());
    });
  }
}
