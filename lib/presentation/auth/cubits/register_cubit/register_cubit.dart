import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../data/models/auth/create_user_req.dart';
import '../../../../domain/use_cases/auth/signup_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> userRegister(
      {required String fullName,
      required String email,
      required String password}) async {
    emit(RegisterLoading());
    var result = await sl<SignupUsecase>().call(
        params: CreateUserReq(
            email: email, fullName: fullName, password: password));

    result.fold((failure) {
      emit(RegisterError(failure));
    }, (success) {
      emit(RegisterSuccess());
    });
  }
}
