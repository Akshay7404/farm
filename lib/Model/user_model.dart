class Usermodel {
  String? UserId;
  String? ProfilePic;
  String? UserFName;
  String? UserLName;
  String? PhoneNumber;
  String? Country;
  String? State;
  String? City;
  String? UserEmail;
  String? Password;
  String? type;
  List<String>? Favorite;
  String? selectdate;
  String? PaymentOption;

  Usermodel(
      {this.UserId,
      this.ProfilePic,
      this.UserFName,
      this.UserLName,
      this.PhoneNumber,
      this.Country,
      this.State,
      this.City,
      this.UserEmail,
      this.Password,
      this.type,
      this.Favorite,
      this.selectdate,
      this.PaymentOption});

  factory Usermodel.fromMap(Map<String, dynamic> map) {
    return Usermodel(
        UserId: map['UserId'],
        ProfilePic: map['ProfilePic'],
        UserFName: map['UserFName'],
        UserLName: map['UserLName'],
        PhoneNumber: map['PhoneNumber'],
        Country: map['Country'],
        State: map['State'],
        City: map['City'],
        UserEmail: map['UserEMail'],
        Password: map['Password'],
        type: map['type'],
        Favorite: map["Favorite"] == null
            ? []
            : map["Favorite"].map<String>((i) => i as String).toList(),
        selectdate: map['selectdate'],
        PaymentOption: map['PaymentOption']);
  }
  Map<String, dynamic> toMap() {
    return {
      'UserId': UserId,
      'ProfilePic': ProfilePic,
      'UserFName': UserFName,
      'UserLName': UserLName,
      'PhoneNumber': PhoneNumber,
      'Country': Country,
      'State': State,
      'City': City,
      'UserEMail': UserEmail,
      'Password': Password,
      'Favorite': Favorite,
      'type': type,
      'selectdate': selectdate,
      'PaymentOption': PaymentOption
    };
  }
}
