class Usermodel {
  String? UserId;
  String? UserFName;
  String? UserLName;
  String? UserEmail;
  String? Password;

  Usermodel(
      {this.UserId,
      this.UserFName,
      this.UserLName,
      this.UserEmail,
      this.Password});

  factory Usermodel.fromMap(Map<String, dynamic> map) {
    return Usermodel(
        UserId: map['UserId'],
        UserFName: map['UserFName'],
        UserLName: map['UserLName'],
        UserEmail: map['UserEMail'],
        Password: map['Password']);
  }
  Map<String, dynamic> toMap() {
    return {
      'UserId': UserId,
      'UserFName': UserFName,
      'UserLName': UserLName,
      'UserEMail': UserEmail,
      'Password': Password
    };
  }
}
