import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Color.dart';
import 'Style.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

Widget appTextField({
  double? toppadding,
  double? leftpadding,
  double? rightpadding,
  bool? isborder = false,
  bool? iscountrycode,
  bool? customcolor,
  Object? countrycode,
  bool? iscountryimgsufix = false,
  String? countryflag,
  int? maxLenght,
  Function(String)? changed,
  FormFieldValidator<String>? validation,
  String? errormsg,
  bool? isReadOnly,
  bool? isPassword,
  String? hintText,
  Function()? click,
  Function()? suffixClick,
  TextInputType? keyboardType,
  bool? isuffixShow,
  bool? isprefixshow,
  String? customSuffixPath,
  String? prefixxPath,
  String? customprefix,
  bool? assetsprefi,
  int? maxlines,
  String? prefixText,
  List<TextInputFormatter>? inputFormattersCustome,
  bool? isMobileFormat,
  Color? textColor,
  int? fontsize,
  String? countertext,
  String? helpertext,
  Color? hintColor,
  GlobalKey<FormFieldState>? formfieldkey,
  Color? suffixColor,
  bool autoFocus = false,
  IconButton? suffixIcon,
  bool? isuppercase,
  Color? bordercolor,
  double? textsize = 16,
  bool? isertworkimeqage = true,
  required TextEditingController textEditingController,
}) {
  if (isReadOnly == null) isReadOnly = false;
  if (isPassword == null) isPassword = false;
  if (isMobileFormat == null) isMobileFormat = false;
  if (isuffixShow == null) isuffixShow = false;
  if (hintColor == null) hintColor = rtextfield;
  return TextFormField(
      cursorColor: rPrimarycolor,
      controller: textEditingController,
      readOnly: isReadOnly,
      onTap: click,
      keyboardType: keyboardType,
      obscureText: isPassword,
      maxLines: maxlines,
      decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintStyle: textfieldStyle,
          errorStyle: errorTextfieldStyle,
          suffixIcon: suffixIcon,
          
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8))),
      validator: validation);
}

Widget searchTextField({
  double? toppadding,
  double? leftpadding,
  double? rightpadding,
  bool? isborder = false,
  bool? iscountrycode,
  bool? customcolor,
  Object? countrycode,
  bool? iscountryimgsufix = false,
  String? countryflag,
  int? maxLenght,
  Function(String)? changed,
  FormFieldValidator<String>? validation,
  String? errormsg,
  bool? isReadOnly,
  bool? isPassword,
  String? hintText,
  Function()? click,
  Function()? suffixClick,
  TextInputType? inputType,
  bool? isuffixShow,
  bool? isprefixshow,
  String? customSuffixPath,
  String? prefixxPath,
  String? customprefix,
  bool? assetsprefi,
  int? maxlines,
  String? prefixText,
  List<TextInputFormatter>? inputFormattersCustome,
  bool? isMobileFormat,
  Color? textColor,
  int? fontsize,
  String? countertext,
  String? helpertext,
  Color? hintColor,
  GlobalKey<FormFieldState>? formfieldkey,
  Color? suffixColor,
  bool autoFocus = false,
  bool? isuppercase,
  Color? bordercolor,
  double? textsize = 16,
  bool? isertworkimeqage = true,
  required TextEditingController textEditingController,
}) {
  if (isReadOnly == null) isReadOnly = false;
  if (isPassword == null) isPassword = false;
  if (isMobileFormat == null) isMobileFormat = false;
  if (isuffixShow == null) isuffixShow = false;
  if (hintColor == null) hintColor = rtextfield;
  return TextFormField(
      cursorColor: rPrimarycolor,
      controller: textEditingController,
      onTap: click,
      readOnly: isReadOnly,
      decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          fillColor: Colors.white,
          hintStyle: textfieldStyle,
          errorStyle: errorTextfieldStyle,
          prefixIcon: Icon(
            Icons.search,
            color: rPrimarycolor,
          ),
          suffixIcon: Icon(
            Icons.filter_list_sharp,
            color: rPrimarycolor,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5))),
      validator: validation);
}
