class PropertyModel {
  String? OwnerId;
  String? Name;
  String? PhoneNumber;
  String? PropertyName;
  String? PropertyAddress;
  String? PropertyCounrty;
  String? PropertyState;
  String? PropertyCity;
  String? PropertyType;
  String? NumberOfBed;
  String? NumberOfSlipingBed;
  String? GuestCapacity;
  String? SwimmingPool;
  String? PropertySize;
  String? RentWeekDays;
  String? RentWeekEnds;
  String? AdditionalGuests;
  String? AdditionalGuestsCharge;
  String? isDiscount;
  String? DiscountPrice;
  String? CleaningFees;
  String? SecurityDeposit;
  List<dynamic>? Facilities;
  List<dynamic>? Amenities;
  List<dynamic>? Terms_and_Ruls;
  List<dynamic>? PropertyImage;
  String? documentid;

  PropertyModel(
      {this.OwnerId,
      this.Name,
      this.PhoneNumber,
      this.PropertyName,
      this.PropertyAddress,
      this.PropertyCounrty,
      this.PropertyState,
      this.PropertyCity,
      this.PropertyType,
      this.NumberOfBed,
      this.NumberOfSlipingBed,
      this.GuestCapacity,
      this.SwimmingPool,
      this.PropertySize,
      this.RentWeekDays,
      this.RentWeekEnds,
      this.AdditionalGuests,
      this.AdditionalGuestsCharge,
      this.isDiscount,
      this.DiscountPrice,
      this.CleaningFees,
      this.SecurityDeposit,
      this.Facilities,
      this.Amenities,
      this.Terms_and_Ruls,
      this.PropertyImage,
      this.documentid});

  factory PropertyModel.fromMap(Map<String, dynamic> map) {
    return PropertyModel(
        OwnerId: map['OwnerId'],
        Name: map['Name'],
        PhoneNumber: map['PhoneNumber'],
        PropertyName: map['PropertyName'],
        PropertyAddress: map['PropertyAddress'],
        PropertyCounrty: map['PropertyCounrty'],
        PropertyState: map['PropertyState'],
        PropertyCity: map['PropertyCity'],
        PropertyType: map['PropertyType'],
        NumberOfBed: map['NumberOfBed'],
        NumberOfSlipingBed: map['NumberOfSlipingBed'],
        GuestCapacity: map['GuestCapacity'],
        SwimmingPool: map['SwimmingPool'],
        PropertySize: map['PropertySize'],
        RentWeekDays: map['RentWeekDays'],
        RentWeekEnds: map['RentWeekEnds'],
        AdditionalGuests: map['AdditionalGuests'],
        AdditionalGuestsCharge: map['AdditionalGuestsCharge'],
        isDiscount: map['Discount'],
        DiscountPrice: map['Discountprice'],
        CleaningFees: map['CleaningFees'],
        SecurityDeposit: map['SecurityDeposit'],
        Facilities: map['Facilities'],
        Amenities: map['Amenities'],
        Terms_and_Ruls: map['Terms_and_Ruls'],
        PropertyImage: map['PropertyImage'],
        documentid: map['documentid']);
  }
  Map<String, dynamic> toMap() {
    return {
      'OwnerId': OwnerId,
      'Name': Name,
      'PhoneNumber': PhoneNumber,
      'PropertyName': PropertyName,
      'PropertyAddress': PropertyAddress,
      'PropertyCounrty': PropertyCounrty,
      'PropertyState': PropertyState,
      'PropertyCity': PropertyCity,
      'PropertyType': PropertyType,
      'NumberOfBed': NumberOfBed,
      'NumberOfSlipingBed': NumberOfSlipingBed,
      'GuestCapacity': GuestCapacity,
      'SwimmingPool': SwimmingPool,
      'PropertySize': PropertySize,
      'RentWeekDays': RentWeekDays,
      'RentWeekEnds': RentWeekEnds,
      'AdditionalGuests': AdditionalGuests,
      'AdditionalGuestsCharge': AdditionalGuestsCharge,
      'Discount': isDiscount,
      'DiscountPrice': DiscountPrice,
      'CleaningFees': CleaningFees,
      'SecurityDeposit': SecurityDeposit,
      'Facilities': Facilities,
      'Amenities': Amenities,
      'Terms_and_Ruls': Terms_and_Ruls,
      'PropertyImage': PropertyImage,
      'documentid': documentid,
    };
  }
}
