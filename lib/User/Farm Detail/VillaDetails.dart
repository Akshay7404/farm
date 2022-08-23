// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:resortbooking/Model/Property_model.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget Villa_Details(PropertyModel propertyModel) {
  return Row(
    children: [
      Expanded(
        child: Column(
          children: [
            Icon(Icons.home, size: 30),
            Text("Type"),
            Text("${propertyModel.PropertyType}", style: normalStyle),
            heightSpace(10),
            Icon(Icons.bed, size: 30),
            Text("Bedrooms"),
            Text("${propertyModel.NumberOfBed}", style: normalStyle),
          ],
        ),
      ),
      Expanded(
          child: Column(
        children: [
          FaIcon(FontAwesomeIcons.arrows),
          Text("Farm size"),
          Text("${propertyModel.PropertySize}", style: normalStyle),
        ],
      )),
      Expanded(
          child: Column(
        children: [
          Icon(Icons.person, size: 30),
          Text("Guest Capacity"),
          Text("${propertyModel.GuestCapacity}", style: normalStyle),
          heightSpace(10),
          FaIcon(FontAwesomeIcons.personSwimming),
          Text("Swimming pool"),
          Text("${propertyModel.SwimmingPool}", style: normalStyle),
        ],
      )),
    ],
  );
}

Widget Villa_Amenities(PropertyModel propertyModel) {
  return Row(children: [
    Expanded(
      child: Column(
        children: [
          Amenities_item("${propertyModel.Amenities![0]}"),
          Amenities_item("${propertyModel.Amenities![1]}"),
          Amenities_item("${propertyModel.Amenities![2]}"),
          Amenities_item("${propertyModel.Amenities![3]}")
        ],
      ),
    ),
    Expanded(
      child: Column(
        children: [
          Amenities_item("${propertyModel.Amenities![4]}"),
          Amenities_item("${propertyModel.Amenities![5]}"),
          Amenities_item("${propertyModel.Amenities![6]}"),
          Amenities_item("${propertyModel.Amenities![7]}"),
          Amenities_item("${propertyModel.Amenities![8]}"),
        ],
      ),
    )
  ]);
}

Widget Amenities_item(String Title) {
  return Row(
    children: [
      Icon(Icons.arrow_forward_ios, color: rPrimarycolor, size: 15),
      Text(Title, style: normalStyle)
    ],
  );
}

Widget Villa_Facilities(PropertyModel propertyModel) {
  return Row(children: [
    Expanded(
      child: Column(
        children: [
          Facilities_item("${propertyModel.Facilities![0]}"),
          Facilities_item("${propertyModel.Facilities![1]}"),
          Facilities_item("${propertyModel.Facilities![2]}"),
          Facilities_item("${propertyModel.Facilities![3]}"),
          Facilities_item("${propertyModel.Facilities![4]}"),
          Facilities_item("${propertyModel.Facilities![5]}"),
        ],
      ),
    ),
    Expanded(
      child: Column(
        children: [
          Facilities_item("${propertyModel.Facilities![6]}"),
          Facilities_item("${propertyModel.Facilities![7]}"),
          Facilities_item("${propertyModel.Facilities![8]}"),
          Facilities_item("${propertyModel.Facilities![9]}"),
          Facilities_item("${propertyModel.Facilities![10]}"),
          Facilities_item("${propertyModel.Facilities![11]}"),
          Facilities_item("${propertyModel.Facilities![12]}"),
        ],
      ),
    )
  ]);
}

Widget Facilities_item(String Title) {
  return Row(
    children: [
      Icon(Icons.arrow_forward_ios, color: rPrimarycolor, size: 15),
      Text(Title, style: normalStyle)
    ],
  );
}

Widget Villa_Guidelines(PropertyModel propertyModel) {
  return Row(children: [
    Expanded(
      child: Column(
        children: [
          Guidelines_itm("${propertyModel.Terms_and_Ruls![0]}"),
          Guidelines_itm("${propertyModel.Terms_and_Ruls![1]}"),
        ],
      ),
    ),
    Expanded(
      child: Column(
        children: [
          Guidelines_itm("${propertyModel.Terms_and_Ruls![2]}"),
          Guidelines_itm("${propertyModel.Terms_and_Ruls![3]}"),
          Guidelines_itm("${propertyModel.Terms_and_Ruls![4]}"),
        ],
      ),
    )
  ]);
}

Widget Guidelines_itm(String Title) {
  return Row(
    children: [
      Icon(Icons.arrow_forward_ios, color: rPrimarycolor, size: 15),
      Flexible(child: Text(Title, style: normalStyle))
    ],
  );
}
