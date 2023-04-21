// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:exploration_app/model/category.dart';

class Activity {
  int idActivity;
  String name;
  String description;
  DateTime date;
  TimeOfDay time;
  Category category;

  Activity({
    required this.idActivity,
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    required this.category,
  });
}

var activityList = [
  
];
