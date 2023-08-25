class UserModel {
  String? name;
  String? phoneNumber;
  String? profilePic;
  String? uid;

  UserModel({
    required this.phoneNumber,
    required this.profilePic,
    required this.uid,
    required this.name,
  });

  // from map:
  UserModel.fromMap(Map<String, dynamic> map) {
    name: map['name'];
    uid: map['uid'];
    phoneNumber: map['phoneNumber'];
    profilePic: map['profilePic'];
  }

  //to map:
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "uid": uid,
      "phoneNumber": phoneNumber,
      "profilePic": profilePic,
    };
  }
}
