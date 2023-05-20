class UserModel {
  String name;
  String phoneNumber;
  String? profilePic;
  String createdAt;
  String uid;

  UserModel({
    required this.phoneNumber,
    required this.profilePic,
    required this.createdAt,
    required this.uid,
    required this.name,
  });

  // from map:
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      profilePic: map['profilePic'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  //to map:
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "uid": uid,
      "phoneNumber": phoneNumber,
      "createdAt": createdAt,
      "profilePic": profilePic,
    };
  }
}
