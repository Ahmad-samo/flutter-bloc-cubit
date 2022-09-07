// ignore_for_file: avoid_types_as_parameter_names

import 'dart:convert';

class Quote {
  late String? qoute;

  Quote.fromJson(Map<String, dynamic> json) {
    qoute = json['quote'];
  }
}
