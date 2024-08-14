import '../../../domain/entities/auth/user_entity.dart';

class UserModel {
  String? userId;
  final String fullName;
  final String email;
  UserModel({this.userId, required this.fullName, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      userId: data['userID'],
      fullName: data['fullName'],
      email: data['email'],
    );
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(fullName: fullName, userId: userId!, email: email);
  }
}
