import 'package:dartz/dartz.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/usecase/usecase.dart';
import '../../repository/auth/auth_repository.dart';

class GetUserUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) {
    return sl<AuthRepository>().getUser();
  }
}
