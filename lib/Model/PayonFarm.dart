import 'package:resortbooking/Model/user_model.dart';

class PaymentProoerty {
  String? Name;
  String? Email;
  String? PhoneNumber;
  String? selectdate;
  String? PaymentMethod;
  String? PropertyName;
  String? PropertyAddress;
  String? PropertyPhone;

  PaymentProoerty(
      {this.Name,
      this.Email,
      this.PhoneNumber,
      this.selectdate,
      this.PaymentMethod,
      this.PropertyName,
      this.PropertyAddress,
      this.PropertyPhone});

  factory PaymentProoerty.fromMap(Map<String, dynamic> map) {
    return PaymentProoerty(
        Name: map['Name'],
        Email: map['Email'],
        PhoneNumber: map['PhoneNumber'],
        selectdate: map['selectdate'],
        PaymentMethod: map['PaymentMethod'],
        PropertyName: map['PropertyName'],
        PropertyAddress: map['PropertyAddress'],
        PropertyPhone: map['PropertyPhone']);
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
      'PropertyPhone': PropertyPhone
    };
  }
}
