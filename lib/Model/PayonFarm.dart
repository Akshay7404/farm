class PaymentProoerty {
  String? Name;
  String? Email;
  String? PhoneNumber;
  String? selectdate;
  String? PaymentMethod;
  String? PropertyName;
  String? PropertyAddress;
  String? PropertyPhone;
  String? subtotal;
  String? Discount;
  String? total;
  String? PropertyId;
  String? Uid;
  String? profileUrl;

  PaymentProoerty(
      {this.Name,
      this.Email,
      this.PhoneNumber,
      this.selectdate,
      this.PaymentMethod,
      this.PropertyName,
      this.PropertyAddress,
      this.PropertyPhone,
      this.subtotal,
      this.Discount,
      this.total,
      this.PropertyId,
      this.Uid,
      this.profileUrl});

  factory PaymentProoerty.fromMap(Map<String, dynamic> map) {
    return PaymentProoerty(
        Name: map['Name'],
        Email: map['Email'],
        PhoneNumber: map['PhoneNumber'],
        selectdate: map['selectdate'],
        PaymentMethod: map['PaymentMethod'],
        PropertyName: map['PropertyName'],
        PropertyAddress: map['PropertyAddress'],
        PropertyPhone: map['PropertyPhone'],
        subtotal: map['subtotal'],
        Discount: map['Discount'],
        total: map['total'],
        PropertyId: map['PropertyId'],
        Uid: map['Uid'],
        profileUrl: map['profileUrl']);
  }

  Map<String, dynamic> toMap() {
    return {
      'Name': Name,
      'Email': Email,
      'PhoneNumber': PhoneNumber,
      'selectdate': selectdate,
      'PaymentMethod': PaymentMethod,
      'PropertyName': PropertyName,
      'PropertyAddress': PropertyAddress,
      'PropertyPhone': PropertyPhone,
      'subtotal': subtotal,
      'Discount': Discount,
      'total': total,
      'PropertyId': PropertyId,
      'Uid': Uid,
      'profileUrl': profileUrl
    };
  }
}
