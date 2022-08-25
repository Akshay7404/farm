// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_build_context_synchronously, depend_on_referenced_packages, unused_import

import 'dart:developer';
import 'dart:io';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/Admin/Google%20map/GoogleMap.dart';
import 'package:resortbooking/Admin/Google%20map/abc.dart';
import 'package:resortbooking/Admin/Property/Cottage.dart';
import 'package:resortbooking/Admin/Property/FarmHouse.dart';
import 'package:resortbooking/Admin/Property/Tent.dart';
import 'package:resortbooking/Admin/Property/Villa.dart';
import 'package:resortbooking/Model/FarmOwner_model.dart';
import 'package:resortbooking/Model/Property_model.dart';
import 'package:resortbooking/User/Booking/FarmBooking.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart  ';
import 'package:csc_picker/csc_picker.dart';

class AddFarm extends StatefulWidget {
  const AddFarm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddFarm> createState() => _AddFarmState();
}

class _AddFarmState extends State<AddFarm> {
  final name_control = TextEditingController();
  final mobile_control = TextEditingController();
  final property_control = TextEditingController();
  final address_control = TextEditingController();

  List<String> AreaList = ["Farm House", "Villa", "Cottage", "Tent"];
  String? selectedValue;
  final _form = GlobalKey<FormState>();

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  late List<XFile>? selectedImages;
  void selectImages() async {
    selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages!);
    }

    setState(() {});
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0,
        centerTitle: true,
        title: Text(
          "Add Farm",
          style: TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enter your Property Details", style: TitleStyle),
                heightSpace(10),
                Text("Enter your name", style: normalStyle),
                heightSpace(8),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 25,
                        offset: Offset(5, 5)),
                  ]),
                  child: appTextField(
                    textEditingController: name_control,
                    hintText: 'Full name',
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Name';
                      }
                    },
                  ),
                ),
                heightSpace(10),
                Text("Enter Your Mobile Number", style: normalStyle),
                heightSpace(8),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(5, 5)),
                  ]),
                  child: appTextField(
                    textEditingController: mobile_control,
                    hintText: 'Mobile Number',
                    keyboardType: TextInputType.number,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Mobile Number';
                      }
                    },
                  ),
                ),
                heightSpace(20),
                Text("Property Information",
                    style:
                        TextStyle(fontFamily: 'NotoSans-Medium', fontSize: 18)),
                heightSpace(15),
                Text("Property Name", style: normalStyle),
                heightSpace(8),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 25,
                        offset: Offset(5, 5)),
                  ]),
                  child: appTextField(
                    textEditingController: property_control,
                    hintText: 'Farm House / Villa Name',
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Property Name';
                      }
                    },
                  ),
                ),
                heightSpace(20),
                Row(
                  children: [
                    Text("Property Address", style: normalStyle),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: MapAddress(),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              address_control.text = value;
                            });
                          }
                        });
                      },
                      child: Text("Pick From Map",
                          style: TextStyle(
                              color: rPrimarycolor,
                              fontFamily: 'NotoSans-Medium')),
                    )
                  ],
                ),
                heightSpace(8),
                Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5)),
                    ]),
                    child: appTextField(
                      textEditingController: address_control,
                      hintText: 'Address',
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Property Address';
                        }
                      },
                    )),
                heightSpace(20),
                Text("Property Location", style: normalStyle),
                heightSpace(8),
                CSCPicker(
                  onCountryChanged: (value) {
                    setState(() {
                      countryValue = value;
                    });
                  },
                  onStateChanged: (value) {
                    setState(() {
                      stateValue = value;
                    });
                  },
                  onCityChanged: (value) {
                    setState(() {
                      cityValue = value;
                    });
                  },
                ),
                heightSpace(20),
                Text("Types of Property", style: normalStyle),
                heightSpace(8),
                Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5)),
                    ]),
                    child: AreaItem()),
                heightSpace(20),
                if (selectedValue == "Farm House") FarmHouse(),
                if (selectedValue == "Villa") Villa(),
                if (selectedValue == "Cottage") Cottage(),
                if (selectedValue == "Tent") Tent(),
                heightSpace(20),
                Text("Property Photos",
                    style:
                        TextStyle(fontFamily: 'NotoSans-Medium', fontSize: 18)),
                Text("Upload Images", style: normalStyle),
                TextButton(
                  child:
                      Text("Add Image", style: TextStyle(color: rPrimarycolor)),
                  onPressed: () {
                    selectImages();
                  },
                ),
                GridView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: imageFileList!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(imageFileList![index].path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
                BouncingWidget(
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        color: rPrimarycolor),
                    child: Center(
                      child: Text("Submit", style: buttonStyle),
                    ),
                  ),
                  onPressed: () {
                    if (_form.currentState!.validate() &&
                        selectedValue == "Farm House") {
                      AddFarmDetaistoFirestore();
                    }
                    if (_form.currentState!.validate() &&
                        selectedValue == "Villa") {
                      AddVillaDetaistoFirestore();
                    }
                    if (_form.currentState!.validate() &&
                        selectedValue == "Cottage") {
                      AddCottageDetaistoFirestore();
                    }
                    if (_form.currentState!.validate() &&
                        selectedValue == "Tent") {
                      AddTentDetaistoFirestore();
                    }
                    Upload(imageFileList!);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? countryValue;
  String? stateValue;
  String? cityValue;
  Widget AreaItem() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        hint: Text('Select Property', style: textfieldStyle),
        items: AreaList.map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: const TextStyle(fontSize: 14)),
            )).toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        buttonHeight: 50,
        buttonWidth: MediaQuery.of(context).size.width * 0.94,
        itemHeight: 40,
        buttonPadding: EdgeInsets.only(left: 20, right: 10),
      ),
    );
  }

  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  void AddFarmDetaistoFirestore() async {
    User? addfarm = _auth.currentUser;
    PropertyModel addFarmModel = PropertyModel();
    addFarmModel.OwnerId = addfarm!.uid;
    addFarmModel.Name = name_control.text;
    addFarmModel.PhoneNumber = mobile_control.text;
    addFarmModel.PropertyName = property_control.text;
    addFarmModel.PropertyAddress = address_control.text;
    addFarmModel.PropertyCounrty = countryValue.toString();
    addFarmModel.PropertyState = stateValue.toString();
    addFarmModel.PropertyCity = cityValue.toString();
    addFarmModel.PropertyType = selectedValue;
    addFarmModel.AdditionalGuests = additionalguest.toString();
    addFarmModel.GuestCapacity = Farm_guestCapacity.text;
    addFarmModel.SwimmingPool = Farm_Swimmingpoll.text;
    addFarmModel.PropertySize = Farm_farmsize.text;
    addFarmModel.RentWeekDays = Farm_RentWeekdays.text;
    addFarmModel.RentWeekEnds = Farm_RentWeekends.text;
    addFarmModel.AdditionalGuestsCharge = Farm_AdditionalGuestCharge.text;
    addFarmModel.isDiscount = Discount.toString();
    addFarmModel.DiscountPrice = Farm_Discount.text;
    addFarmModel.CleaningFees = Farm_CleaningFees.text;
    addFarmModel.SecurityDeposit = Farm_SecurityDeposit.text;
    addFarmModel.Facilities = Farm_Facilities_data;
    addFarmModel.Amenities = Farm_Amenities_data;
    addFarmModel.Terms_and_Ruls = Farm_Terms_and_Ruls;

    await firebaseFirestore.collection('Property').add(addFarmModel.toMap());

    Fluttertoast.showToast(msg: "Add farm sucessfully :) ");
  }

  void AddVillaDetaistoFirestore() async {
    User? addvilla = _auth.currentUser;
    PropertyModel addVillaModel = PropertyModel();
    addVillaModel.OwnerId = addvilla!.uid;
    addVillaModel.Name = name_control.text;
    addVillaModel.PhoneNumber = mobile_control.text;
    addVillaModel.PropertyName = property_control.text;
    addVillaModel.PropertyAddress = address_control.text;
    addVillaModel.PropertyCounrty = countryValue.toString();
    addVillaModel.PropertyState = stateValue.toString();
    addVillaModel.PropertyCity = cityValue.toString();
    addVillaModel.PropertyType = selectedValue;
    addVillaModel.NumberOfBed = Villa_numberofbed.text;
    addVillaModel.GuestCapacity = Villa_guestCapacity.text;
    addVillaModel.SwimmingPool = Villa_Swimmingpoll.text;
    addVillaModel.PropertySize = Villa_size.text;
    addVillaModel.RentWeekDays = Villa_RentWeekdays.text;
    addVillaModel.RentWeekEnds = Villa_RentWeekends.text;
    addVillaModel.AdditionalGuests = villaadditionalguest.toString();
    addVillaModel.AdditionalGuestsCharge = Villa_AdditionalGuestCharge.text;
    addVillaModel.CleaningFees = Villa_CleaningFees.text;
    addVillaModel.SecurityDeposit = Villa_SecurityDeposit.text;
    addVillaModel.Facilities = Villa_Facilities;
    addVillaModel.Amenities = Villa_Amenities;
    addVillaModel.Terms_and_Ruls = Villa_Terms_and_Ruls;

    await firebaseFirestore.collection('Property').add(addVillaModel.toMap());

    Fluttertoast.showToast(msg: "Add Villa Sucessfully :) ");
  }

  void AddCottageDetaistoFirestore() async {
    User? addcottage = _auth.currentUser;
    PropertyModel addCottageModel = PropertyModel();
    addCottageModel.OwnerId = addcottage!.uid;
    addCottageModel.Name = name_control.text;
    addCottageModel.PhoneNumber = mobile_control.text;
    addCottageModel.PropertyName = property_control.text;
    addCottageModel.PropertyAddress = address_control.text;
    addCottageModel.PropertyCounrty = countryValue.toString();
    addCottageModel.PropertyState = stateValue.toString();
    addCottageModel.PropertyCity = cityValue.toString();
    addCottageModel.PropertyType = selectedValue;
    addCottageModel.NumberOfBed = Cottage_numberofbed.text;
    addCottageModel.GuestCapacity = Cottage_guestCapacity.text;
    addCottageModel.SwimmingPool = Cottage_Swimmingpoll.text;
    addCottageModel.PropertySize = Cottage_size.text;
    addCottageModel.RentWeekDays = Cottage_RentWeekdays.text;
    addCottageModel.RentWeekEnds = Cottage_RentWeekends.text;
    addCottageModel.AdditionalGuests = cottageadditionalguest.toString();
    addCottageModel.AdditionalGuestsCharge = Cottage_AdditionalGuestCharge.text;
    addCottageModel.CleaningFees = Cottage_CleaningFees.text;
    addCottageModel.SecurityDeposit = Cottage_SecurityDeposit.text;
    addCottageModel.Facilities = Cottage_Facilities;
    addCottageModel.Amenities = Cottage_Amenities;
    addCottageModel.Terms_and_Ruls = Cottage_Terms_and_Ruls;

    await firebaseFirestore.collection('Property').add(addCottageModel.toMap());

    Fluttertoast.showToast(msg: "Add Cottage sucessfully :) ");
  }

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  void Upload(List<XFile> Images) async {
    for (int i = 0; i < Images.length; i++) {
      Imageurl = UploadImage(Images[i]);
    }
  }

  Future<String>? Imageurl;
  List<String> imageurls = [];
  Future<String> UploadImage(XFile image) async {
    Reference reference =
        firebaseStorage.ref().child("Farm Image").child(image.name);
    UploadTask uploadTask = reference.putFile(File(image.path));

    TaskSnapshot snapshot = await uploadTask;

    String Url = await snapshot.ref.getDownloadURL();
    imageurls.add(Url);
    print(imageurls);

    return imageurls as Future<String>;
  }

  void AddTentDetaistoFirestore() async {
    User? addtent = _auth.currentUser;
    PropertyModel addTentmodel = PropertyModel();

    addTentmodel.OwnerId = addtent!.uid;
    addTentmodel.Name = name_control.text;
    addTentmodel.PhoneNumber = mobile_control.text;
    addTentmodel.PropertyName = property_control.text;
    addTentmodel.PropertyAddress = address_control.text;
    addTentmodel.PropertyCounrty = countryValue.toString();
    addTentmodel.PropertyState = stateValue.toString();
    addTentmodel.PropertyCity = cityValue.toString();
    addTentmodel.PropertyType = selectedValue;
    addTentmodel.NumberOfSlipingBed = Tent_Slipingbeds.text;
    addTentmodel.GuestCapacity = Tent_guestCapacity.text;
    addTentmodel.RentWeekDays = Tent_RentWeekdays.text;
    addTentmodel.RentWeekEnds = Tent_RentWeekends.text;
    addTentmodel.Facilities = Tent_Facilities;
    addTentmodel.Amenities = Tent_Amenities;
    addTentmodel.Terms_and_Ruls = Tent_Terms_and_Ruls;

    addTentmodel.PropertyImage = imageurls;

    await firebaseFirestore.collection('Property').add(addTentmodel.toMap());

    Fluttertoast.showToast(msg: "Add Tent Sucessfully :) ");
  }
}
