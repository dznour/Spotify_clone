import 'package:dartz/dartz.dart';

import '../../../data/models/auth/create_user_req.dart';
import '../../../data/models/auth/signin_user_req.dart';

abstract class AuthRepository {
  Future<Either> userSignIn(SigninUserReq user);
  Future<Either> userSignUp(CreateUserReq user);
  Future<Either> getUser();
}
