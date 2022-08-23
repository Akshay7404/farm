class UserReviewRoom {
  String? Roomid;
  Map<String, dynamic>? Participants;

  UserReviewRoom({this.Roomid, this.Participants});

  factory UserReviewRoom.fromMap(Map<String, dynamic> map) {
    return UserReviewRoom(
        Roomid: map['Roomid'], Participants: map['Participants']);
  }
  Map<String, dynamic> toMap() {
    return {'Roomid': Roomid, 'Participants': Participants};
  }
}
