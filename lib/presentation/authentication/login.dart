import 'package:flutter/material.dart';
import 'package:promilo/presentation/!components/custom_asset_image_widget.dart';
import 'package:promilo/presentation/!components/custom_text_field_widget.dart';
import 'package:promilo/presentation/!components/header_widget.dart';
import 'package:promilo/presentation/!components/loading_widget.dart';
import 'package:promilo/presentation/authentication/login_provider.dart';
import 'package:promilo/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizable/sizable.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => LoginProvider(),
          child: Consumer<LoginProvider>(
            builder: (context, value, widget) {
              return Padding(
                padding: spacing(value: 20),
                child: Form(
                  key: value.formState,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      20.sizeh,
                      headerWidget("Promilo",
                          fontWeight: FontWeight.w400, fontSize: 18),
                      20.sizeh,
                      headerWidget("Hi! Welcome Back"),
                      20.sizeh,
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Please Sign In to continue",
                            style: TextStyle(fontFamily: "PoppinsMedium"),
                          )),
                      customTextFieldWidget(
                        controller: value.usernameController,
                        label: "Enter Email or Mobile",
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "Enter a username";
                          } else if(!p0.contains("@")) {
                            return "Enter a valid email address!";
                          }
                          return null;
                        },
                        onChanged: (p0) {
                          value.isFilledFn();
                        },
                      ),
                      headerWidget("Sign In with OTP",
                          fontSize: 15,
                          color: Colors.blue,
                          alignment: Alignment.centerRight),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password",
                            style: TextStyle(fontFamily: "PoppinsMedium"),
                          )),
                      customTextFieldWidget(
                        controller: value.passController,
                        obscureText: true,
                        label: "Enter Password",
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return "Enter a password";
                          }
                          return null;
                        },
                        onChanged: (p0) {
                          value.isFilledFn();
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: value.isRememberme,
                                onChanged: (val) {
                                  value.isRememberme = !value.isRememberme;
                                  value.refresh();
                                },
                              ),
                              Text("Remember Me")
                            ],
                          ),
                          headerWidget("Forgot Password",
                              fontSize: 15, color: Colors.blue),
                        ],
                      ),
                      25.sizeh,
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue
                              .withOpacity(value.isFilled == true ? 1 : .4)),
                          side: MaterialStateProperty.all(
                            BorderSide(width: 2, color: Colors.blueAccent),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (value.isFilled == false) return;
                          if (value.formState.currentState!.validate()) {
                            value.postAction(context);
                          }
                          // Navigator.pushNamed(context, HomeScreen.routeName);
                        },
                        child: value.isLoading
                            ? loadingWidget()
                            : headerWidget("Submit",
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "PoppinsSemiBold"),
                      ),
                      10.sizeh,
                      InkWell(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              HomeScreen.routeName, (route) => false);
                        },
                        child: headerWidget("Skip",
                            fontSize: 15, color: Colors.blue,alignment: Alignment.centerRight,),
                      ),
                      20.sizeh,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withOpacity(.4),
                              height: 5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'or',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withOpacity(.4),
                              height: 5,
                            ),
                          ),
                        ],
                      ),
                      10.sizeh,
                      Wrap(
                        children: List.generate(
                          value.socialIcons.length,
                          (index) => Padding(
                            padding: spacingSym(v: 5, h: 5),
                            child: customAssetsImage(
                                "assets/icons/${value.socialIcons[index]}.png",
                                size: 40),
                          ),
                        ),
                      ),
                      20.sizeh,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Business User?",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontFamily: "PoppinsSemiBold"),
                              ),
                              Text(
                                "Login Here",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontFamily: "PoppinsSemiBold"),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontFamily: "PoppinsSemiBold"),
                              ),
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontFamily: "PoppinsSemiBold"),
                              ),
                            ],
                          ),
                        ],
                      ),
                      30.sizeh,
                      SizedBox(
                        width: width(context) * .7,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                  text:
                                      "By continuing, you agree to Promilo's "),
                              TextSpan(
                                text: "Use of Terms & Privacy Policy",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
