import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:promilo/core/apiServices/api_services.dart';
import 'package:promilo/core/utils/show_snackbar.dart';
import 'package:promilo/data/errorHandling/api_error_handling.dart';
import 'package:promilo/data/model/data_model.dart';
import 'package:promilo/presentation/home/home_screen.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;

  bool isFilled = false;
  bool isRememberme = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final formState = GlobalKey<FormState>();

  List<String> socialIcons = [
    "google",
    "linkedin",
    "facebook",
    "instagram",
    "whatsapp"
  ];

  refresh() {
    notifyListeners();
  }

  isFilledFn() {
    if (usernameController.text.isEmpty || passController.text.isEmpty) {
      isFilled = false;
    } else {
      isFilled = true;
    }
    notifyListeners();
  }

  Future<DataModel> loginReq() => tryCatchFunction(
        method: () =>
            client.loginReq(usernameController.text, convertosha256()),
      );

  postAction(BuildContext context) async {
    if (usernameController.text.isEmpty || passController.text.isEmpty) {
      showSnackBar(context, "Please fill the form to continue!");
      return;
    }
    isLoading = true;
    notifyListeners();

    // final Map<String, dynamic> data = {
    //   "username": usernameController.text,
    //   "password": convertosha256()
    // };

    final response = await loginReq();
    if (response.status == 'success') {
      // save the access_token from response in SharedPreferences

      //
      isLoading = false;
      notifyListeners();
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (route) => false);
    } else {
      showSnackBar(context, response.msg ?? "Something Went Wrong!");
      isLoading = false;
      notifyListeners();
    }
  }

  String convertosha256() {
    var bytes = utf8.encode(passController.text);

    var digest = sha256.convert(bytes);

    return digest.toString();
  }
}
