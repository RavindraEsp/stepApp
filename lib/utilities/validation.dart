import 'package:flutter/cupertino.dart';


class Validators {
  BuildContext context;

  Validators(this.context);

  String? validatorName(value) {
    if (value.isEmpty) {
      return "Not Valid";
    }
    return null;
  }





}
