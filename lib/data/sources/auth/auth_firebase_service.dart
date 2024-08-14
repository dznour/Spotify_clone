import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/utils/constants.dart';
import '../../../domain/entities/auth/user_entity.dart';
import '../../models/auth/create_user_req.dart';
import '../../models/auth/signin_user_req.dart';
import '../../models/auth/user_model.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(SigninUserReq user);
  Future<Either> signUp(CreateUserReq user);
  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SigninUserReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      return right('Login Success');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user';
      }

      return Left(message);
    }
  }

  @override
  Future<Either<String, String>> signUp(CreateUserReq user) async {
    try {
      var userCred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      FirebaseFirestore.instance
          .collection(kUsersCollection)
          .doc(userCred.user!.uid)
          .set({'fullName': user.fullName, 'email': userCred.user?.email});
      return right('Success Signup');
    } on FirebaseAuthException catch (e) {
      String errMsg = '';
      switch (e.code) {
        case 'email-already-in-use':
          errMsg =
              'This Email Already Exists. Try Logging in Or Use Another Email';
          break;
        case 'invalid-email':
          errMsg =
              'This Email Already Exists. Try Logging in Or Use Another Email';
          break;
        case 'operation-not-allowed':
          errMsg = 'This Operation Is Disabled For Now, Please Try Again Later';
          break;
        case 'weak-password':
          errMsg = errMsg = 'Please Use A Stronger Password';
          break;
        default:
          errMsg = 'There Was An Error, Please Try Again Later';
      }
      return left(errMsg);
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      var user = await firestore
          .collection(kUsersCollection)
          .doc(auth.currentUser!.uid)
          .get();
      UserModel userModel = UserModel.fromJson(user.data()!);
      userModel.userId = auth.currentUser!.uid;
      UserEntity entity = userModel.toEntity();
      return right(entity);
    } catch (e) {
      return left(e.toString());
    }
  }
}
