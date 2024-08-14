import 'package:dartz/dartz.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/usecase/usecase.dart';
import '../../../data/models/auth/create_user_req.dart';
import '../../repository/auth/auth_repository.dart';

class SignupUsecase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().userSignUp(params!);
  }
}
