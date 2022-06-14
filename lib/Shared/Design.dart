import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    border: InputBorder.none,
    fillColor: kPrimaryLightColor,
    filled: true,
);


const textInputFDecoration = InputDecoration(
    border: InputBorder.none,
    fillColor: kPrimaryLightColor,
    filled: true,
    suffixIcon: Icon(
        Icons.edit,
        color: kPrimaryColor,
    ),
);

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);