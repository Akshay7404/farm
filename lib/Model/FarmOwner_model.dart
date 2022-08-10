class FarmOwnermodel {
  String? FarmOwnerId;
  String? FarmOwnerFName;
  String? FarmOwnerLName;
  String? FarmOwnerEmail;
  String? FarmOwnerPassword;

  FarmOwnermodel(
      {this.FarmOwnerId,
      this.FarmOwnerFName,
      this.FarmOwnerLName,
      this.FarmOwnerEmail,
      this.FarmOwnerPassword});

  factory FarmOwnermodel.fromMap(Map<String, dynamic> map) {
    return FarmOwnermodel(
        FarmOwnerId: map['FarmOwnerId'],
        FarmOwnerFName: map['FarmOwnerFName'],
        FarmOwnerLName: map['FarmOwnerLName'],
        FarmOwnerEmail: map['FarmOwnerEMail'],
        FarmOwnerPassword: map['FarmOwnerPassword']);
  }
  Map<String, dynamic> toMap() {
    return {
      'FarmOwnerId': FarmOwnerId,
      'FarmOwnerFName': FarmOwnerFName,
      'FarmOwnerLName': FarmOwnerLName,
      'UserEMail': FarmOwnerEmail,
      'FarmOwnerPassword': FarmOwnerPassword
    };
  }
}
