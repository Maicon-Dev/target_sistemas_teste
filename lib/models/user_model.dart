class UserModel {
  final String id;
  final String email;
  final String userAuthId;
  final String userName;

  UserModel({
    required this.id,
    required this.userAuthId,
    required this.email,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'authId': userAuthId,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      userAuthId: map['userAuthId'],
      email: map['email'],
      userName: map['userName'],
    );
  }
}
