class UserReviewModel {
  String? sender;
  String? messageid;
  String? text;
  DateTime? timestamp;

  UserReviewModel({this.sender, this.messageid, this.text, this.timestamp});

  factory UserReviewModel.fromMap(Map<String, dynamic> map) {
    return UserReviewModel(
        sender: map['sender'],
        messageid: map['messageid'],
        text: map['text'],
        timestamp: map['timestamp']);
  }
  Map<String, dynamic> toMap() {
    return {
      'sender': sender,
      'messageid': messageid,
      'text': text,
      'timestamp': timestamp
    };
  }
}
