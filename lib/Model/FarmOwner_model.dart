class FarmOwnermodel {
  String? FarmOwnerId;
  String? ProfilePic;
  String? FarmOwnerFName;
  String? FarmOwnerLName;
  String? PhoneNumber;
  String? Country;
  String? State;
  String? City;
  String? FarmOwnerEmail;
  String? FarmOwnerPassword;

  FarmOwnermodel(
      {this.FarmOwnerId,
      this.ProfilePic,
      this.FarmOwnerFName,
      this.FarmOwnerLName,
      this.PhoneNumber,
      this.Country,
      this.State,
      this.City,
      this.FarmOwnerEmail,
      this.FarmOwnerPassword});

  factory FarmOwnermodel.fromMap(Map<String, dynamic> map) {
    return FarmOwnermodel(
        FarmOwnerId: map['FarmOwnerId'],
        ProfilePic: map['ProfilePic'],
        FarmOwnerFName: map['FarmOwnerFName'],
        FarmOwnerLName: map['FarmOwnerLName'],
        PhoneNumber: map['PhoneNumber'],
        Country: map['Country'],
        State: map['State'],
        City: map['City'],
        FarmOwnerEmail: map['FarmOwnerEMail'],
        FarmOwnerPassword: map['FarmOwnerPassword']);
  }
  Map<String, dynamic> toMap() {
    return {
      'FarmOwnerId': FarmOwnerId,
      'ProfilePic': ProfilePic,
      'FarmOwnerFName': FarmOwnerFName,
      'FarmOwnerLName': FarmOwnerLName,
      'PhoneNumber': PhoneNumber,
      'Country': Country,
      'State': State,
      'City': City,
      'FarmOwnerEmail': FarmOwnerEmail,
      'FarmOwnerPassword': FarmOwnerPassword
    };
  }
}
