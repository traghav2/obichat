
class MessageModel {
  MessageModel({
    this.senderName,
    this.seen,
    this.message,
    this.createdOn,
    this.dateMessage,
    this.profilePicture,
  });

  String? senderName;
  String? message;
  bool? seen;
  DateTime? createdOn;
  String? dateMessage;
  String? profilePicture;

  MessageModel.fromMap(Map<String, dynamic> map) {
    senderName = map["senderName"];
    message = map["message"];
    createdOn = map["createdOn"];
    profilePicture = map["profilePicture"];
    dateMessage = map["dateMessage"];
  }

  Map<String, dynamic> toMap() {
    return {
      "senderName": senderName,
      "message": message,
      "createdOn": createdOn,
      "profilePicture": profilePicture,
      "dateMessage": dateMessage,
    };
  }
}