import 'package:dartz/dartz.dart';

import '../../../core/services/service_locator.dart';
import '../../../domain/repository/auth/auth_repository.dart';
import '../../models/auth/create_user_req.dart';
import '../../models/auth/signin_user_req.dart';
import '../../sources/auth/auth_firebase_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> userSignIn(SigninUserReq user) async {
    return await sl<AuthFirebaseService>().signIn(user);
  }

  @override
  Future<Either> userSignUp(CreateUserReq user) async {
    return await sl<AuthFirebaseService>().signUp(user);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }
}
