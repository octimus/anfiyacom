import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final dynamic initialValue;
  final Function onChanged;
  final bool obscureText;
  final bool isPhoneNumber;

  bool enableEdit = true;
  TextInputType keyBoardType;
  Function onSave;

  CustomTextField({
    @required this.hint,
    @required this.onChanged,
    this.obscureText = false,
    this.isPhoneNumber,
    this.initialValue,
    this.enableEdit,
    TextInputType textType,
    this.onSave,
    this.keyBoardType,
  });

  @override
  Widget build(BuildContext context) {
    String country_code = isPhoneNumber == true ? "+269" : "";

    return Container(
      height: kItemHeight,
      decoration: kTextFieldDecoration,
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              TextField(
                controller: TextEditingController(text: initialValue),
                obscureText: obscureText,
                onChanged: (val) {
                  onChanged(country_code + val);
                },
                keyboardType: keyBoardType,
                enabled: enableEdit,
                style: TextStyle(
                  fontSize: 20.0,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20.0),
                  alignLabelWithHint: true,
                  hintStyle: TextStyle(fontSize: 20.0),
                  hintText: hint,
                ),
              ),
            ],
          ),
          isPhoneNumber != null && isPhoneNumber
              ? Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 100,
                      child: CountryCodePicker(
                        onChanged: (code) {
                          country_code = code.dialCode;
                        },
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'KM',
                        favorite: ['+269', 'KM'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: true,
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  width: 0,
                  height: 0,
                ),
        ],
      ),
    );
  }
}
