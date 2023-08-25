
class MessageModel {
  MessageModel({
    this.senderName,
    this.seen,
    this.message,
    this.messageDate,
    this.dateMessage,
    this.profilePicture,
  });

  String? senderName;
  String? message;
  bool? seen;
  DateTime? messageDate;
  String? dateMessage;
  String? profilePicture;
}