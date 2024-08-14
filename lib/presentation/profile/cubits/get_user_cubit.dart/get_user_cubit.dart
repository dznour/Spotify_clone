import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../domain/entities/auth/user_entity.dart';
import '../../../../domain/use_cases/auth/get_user_usecase.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit() : super(GetUserInitial());

  Future<void> getUser() async {
    emit(GetUserLoading());
    var result = await sl<GetUserUsecase>().call();
    result.fold((left) {
      emit(GetUserError(left.toString()));
    }, (userEntity) {
      emit(GetUserSuccess(userEntity));
    });
  }
}
