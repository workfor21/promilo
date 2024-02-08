import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DataModel<T> {
  String? status;
  String? msg;
  T? data;

  DataModel({
    this.status,
    this.msg,
    this.data
  });
}