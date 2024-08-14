import 'package:dartz/dartz.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/usecase/usecase.dart';
import '../../../data/models/auth/signin_user_req.dart';
import '../../repository/auth/auth_repository.dart';

class SigninUsecase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return await sl<AuthRepository>().userSignIn(params!);
  }
}
