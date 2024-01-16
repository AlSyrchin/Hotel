import 'package:flutter/material.dart';

class FormBtn {
  int id;
  String name;
  bool isExpanded;
  GlobalObjectKey<FormState> key;
  FormBtn({
    required this.id,
    required this.name,
    required this.isExpanded,
    required this.key,
  });
}