import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'common_widget.dart';
import 'landing_page_screen.dart';
import 'util.dart';
import 'verification_screen.dart';

class RegistrationScreen extends StatefulWidget {
  final void Function() onFinish;
  const RegistrationScreen({super.key, required this.onFinish});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var pageNum = 1;
  TextEditingController tfCountryPhoneController = TextEditingController();
  TextEditingController tfPhoneController = TextEditingController();
  TextEditingController tfPasswordController = TextEditingController();
  TextEditingController tfEmailController = TextEditingController();
  TextEditingController tfAddressController = TextEditingController();
  TextEditingController tfCityController = TextEditingController();
  TextEditingController tfPostCodeController = TextEditingController();
  TextEditingController tfFullNameController = TextEditingController();
  TextEditingController tfUserNameController = TextEditingController();
  TextEditingController tfDateController = TextEditingController();
  TextEditingController tfCountryController = TextEditingController();
  bool hidePassword = true;
  bool enableButtonRegistration = false;
  bool enableButtonVerify = false;
  bool enableButtonEmail = false;
  bool enableButtonAddress = false;
  bool enableButtonPersonalInfo = false;
  bool enableButtonCountry = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Registration"),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 4,
            child: LinearProgressIndicator(
              value: (1 / 8) * pageNum,
              minHeight: 16,
              color: Color(0xFF304FFE),
              backgroundColor: Colors.white,
            ),
          ),
          Expanded(
            child: pageNum == 1
                ? tab1()
                : pageNum == 2
                    ? tab2()
                    : pageNum == 3
                        ? tab3()
                        : pageNum == 4
                            ? tab4()
                            : pageNum == 5
                                ? tab5()
                                : pageNum == 6
                                    ? tab6()
                                    : pageNum == 7
                                        ? tab7()
                                        : pageNum == 8
                                            ? tab8()
                                            : SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget tab8() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Country of residence",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "This info needs to be accurate with your ID document",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Country",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      TextField(
                        readOnly: true,
                        onTap: () {
                          showSheetCustom(
                            cancelable: true,
                            context: context,
                            isTitle: true,
                            title: Text(
                              "Country",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            content: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(top: 8),
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: RowText(
                                  onTap: () {
                                    setState(() {
                                      tfCountryController.text = "Test";
                                      if (tfCountryController.text != "") {
                                        enableButtonCountry = true;
                                      } else {
                                        enableButtonCountry = false;
                                      }
                                    });
                                  },
                                  text1: Icon(Icons.flag),
                                  text2: Text("Test"),
                                  auto: false,
                                  mainAxis: MainAxisAlignment.spaceBetween,
                                  paddingHorizontal: 8,
                                  paddingVertical: 8,
                                  divider: index == 4 ? false : true,
                                ),
                              ),
                              itemCount: 5,
                            ),
                          );
                        },
                        controller: tfCountryController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            if (tfCountryController.text != "") {
                              enableButtonCountry = true;
                            } else {
                              enableButtonCountry = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Country",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffixIcon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey.shade300,
                          ),
                          prefixIcon: tfCountryController.text == ""
                              ? null
                              : Icon(Icons.flag),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MyElevatedButton(
              onTap: enableButtonCountry
                  ? () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LandingPageScreen(
                            onFinish: widget.onFinish,
                            listStatus: [
                              2,
                              1,
                              1,
                            ],
                            nextPage: VerificationScreen(
                              onFinish: widget.onFinish,
                            ),
                          ),
                        ),
                      );
                    }
                  : () {},
              text: "Continue",
              color: enableButtonCountry
                  ? Color(0xFF304FFE)
                  : Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }

  Widget tab7() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add your personal info",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "This info needs to be accurate with your ID document",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Full Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      TextField(
                        controller: tfFullNameController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            if (tfFullNameController.text != "" &&
                                tfUserNameController.text != "" &&
                                tfDateController.text != "") {
                              enableButtonPersonalInfo = true;
                            } else {
                              enableButtonPersonalInfo = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Mr. Jhon Doe",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Username",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      TextField(
                        controller: tfUserNameController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            if (tfFullNameController.text != "" &&
                                tfUserNameController.text != "" &&
                                tfDateController.text != "") {
                              enableButtonPersonalInfo = true;
                            } else {
                              enableButtonPersonalInfo = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "@",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Date of Birth",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      TextField(
                        readOnly: true,
                        onTap: () async {
                          showDatePicker(
                            context: context,
                            firstDate: DateTime(DateTime.now().year),
                            lastDate: DateTime(DateTime.now().year + 3),
                            initialDate: DateTime.now(),
                          ).then(
                            (value) {
                              if (value != null) {
                                tfDateController.text =
                                    "${value.day}/${value.month}/${value.year}";
                                setState(() {
                                  if (tfFullNameController.text != "" &&
                                      tfUserNameController.text != "" &&
                                      tfDateController.text != "") {
                                    enableButtonPersonalInfo = true;
                                  } else {
                                    enableButtonPersonalInfo = false;
                                  }
                                });
                              }
                            },
                          );
                        },
                        controller: tfDateController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            if (tfFullNameController.text != "" &&
                                tfUserNameController.text != "" &&
                                tfDateController.text != "") {
                              enableButtonPersonalInfo = true;
                            } else {
                              enableButtonPersonalInfo = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "MM/DD/YYYY",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MyElevatedButton(
              onTap: enableButtonPersonalInfo
                  ? () {
                      setState(() {
                        pageNum = 8;
                      });
                    }
                  : () {},
              text: "Continue",
              color: enableButtonPersonalInfo
                  ? Color(0xFF304FFE)
                  : Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }

  Widget tab6() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Home address",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "This info needs to be accurate with your ID document",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Address Line",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      TextField(
                        controller: tfAddressController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            if (tfAddressController.text != "" &&
                                tfCityController.text != "" &&
                                tfPostCodeController.text != "") {
                              enableButtonAddress = true;
                            } else {
                              enableButtonAddress = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Mr. Jhon Doe",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "City",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      TextField(
                        controller: tfCityController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            if (tfAddressController.text != "" &&
                                tfCityController.text != "" &&
                                tfPostCodeController.text != "") {
                              enableButtonAddress = true;
                            } else {
                              enableButtonAddress = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "City, State",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Postcode",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      TextField(
                        controller: tfPostCodeController,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          setState(() {
                            if (tfAddressController.text != "" &&
                                tfCityController.text != "" &&
                                tfPostCodeController.text != "") {
                              enableButtonAddress = true;
                            } else {
                              enableButtonAddress = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Ex: 000000",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MyElevatedButton(
              onTap: enableButtonAddress
                  ? () {
                      setState(() {
                        pageNum = 7;
                      });
                    }
                  : () {},
              text: "Continue",
              color: enableButtonAddress
                  ? Color(0xFF304FFE)
                  : Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }

  Widget tab5() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add your email",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "This info needs to be accurate with your ID document",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      TextField(
                        controller: tfEmailController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          setState(() {
                            if (value != "") {
                              enableButtonEmail = true;
                            } else {
                              enableButtonEmail = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "name@example.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MyElevatedButton(
              onTap: enableButtonEmail
                  ? () {
                      setState(() {
                        pageNum = 6;
                      });
                    }
                  : () {},
              text: "Continue",
              color:
                  enableButtonEmail ? Color(0xFF304FFE) : Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }

  Widget tab4() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create passcode",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              "This info needs to be accurate with your ID document",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 24,
              ),
              child: PinCodeTextField(
                enablePinAutofill: false,
                appContext: context,
                length: 4,
                obscureText: true,
                obscuringCharacter: '*',
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  inactiveColor: Colors.grey,
                  selectedColor: Colors.blue,
                  activeColor: Colors.blue,
                  selectedFillColor: Colors.blue,
                  activeFillColor: Colors.blue,
                ),
                // validator: validator,
                cursorColor: Colors.blue,
                animationDuration: const Duration(milliseconds: 0),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  setState(() {
                    if (value.length == 4) {
                      pageNum = 5;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tab3() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Confirm your phone",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "We send 6 digits code to ${tfCountryPhoneController.text} ${tfPhoneController.text}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 24,
                      ),
                      child: PinCodeTextField(
                        enablePinAutofill: false,
                        appContext: context,
                        length: 6,
                        obscureText: true,
                        obscuringCharacter: '*',
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          inactiveColor: Colors.grey,
                          selectedColor: Colors.blue,
                          activeColor: Colors.blue,
                          selectedFillColor: Colors.blue,
                          activeFillColor: Colors.blue,
                        ),
                        // validator: validator,
                        cursorColor: Colors.blue,
                        animationDuration: const Duration(milliseconds: 0),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          setState(() {
                            if (value.length == 6) {
                              enableButtonVerify = true;
                            } else {
                              enableButtonVerify = false;
                            }
                          });
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Didn't get a code? ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                "Resend",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MyElevatedButton(
              onTap: enableButtonVerify
                  ? () {
                      setState(() {
                        pageNum = 4;
                      });
                    }
                  : () {},
              text: "Verify Your Number",
              color:
                  enableButtonVerify ? Color(0xFF304FFE) : Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }

  Widget tab2() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create an Account",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Enter your mobile number to verify your account",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Phone",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              readOnly: true,
                              controller: tfCountryPhoneController,
                              onTap: () => showSheetCustom(
                                cancelable: true,
                                context: context,
                                isTitle: true,
                                title: Text(
                                  "Country",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                content: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.only(top: 8),
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: RowText(
                                      onTap: () {
                                        setState(() {
                                          tfCountryPhoneController.text = "+62";
                                          if (tfCountryPhoneController.text !=
                                                  "" &&
                                              tfPhoneController.text != "" &&
                                              tfPasswordController.text != "") {
                                            enableButtonRegistration = true;
                                          } else {
                                            enableButtonRegistration = false;
                                          }
                                        });
                                      },
                                      text1: Icon(Icons.flag),
                                      text2: Text("Test"),
                                      auto: false,
                                      mainAxis: MainAxisAlignment.spaceBetween,
                                      paddingHorizontal: 8,
                                      paddingVertical: 8,
                                      divider: index == 4 ? false : true,
                                    ),
                                  ),
                                  itemCount: 5,
                                ),
                              ),
                              style: TextStyle(color: Colors.grey),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                hintText: "Country",
                                prefixIcon: tfCountryPhoneController.text == ""
                                    ? null
                                    : Icon(Icons.flag),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 5,
                            child: TextField(
                              controller: tfPhoneController,
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                setState(() {
                                  if (tfCountryPhoneController.text != "" &&
                                      tfPhoneController.text != "" &&
                                      tfPasswordController.text != "") {
                                    enableButtonRegistration = true;
                                  } else {
                                    enableButtonRegistration = false;
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                hintText: "Mobile number",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      TextField(
                        controller: tfPasswordController,
                        obscureText: hidePassword,
                        onChanged: (value) {
                          setState(() {
                            if (tfCountryPhoneController.text != "" &&
                                tfPhoneController.text != "" &&
                                tfPasswordController.text != "") {
                              enableButtonRegistration = true;
                            } else {
                              enableButtonRegistration = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "******",
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            child: hidePassword
                                ? Icon(Icons.visibility_outlined)
                                : Icon(Icons.visibility_off_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MyElevatedButton(
              onTap: enableButtonRegistration
                  ? () {
                      FocusScope.of(context).unfocus();
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      FocusScope.of(context).unfocus();
                                    },
                                    child: Icon(Icons.close),
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/intro_0.png",
                                  scale: 4,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  "Verify your phone number before we send code",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Is this corret? ",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "${tfCountryPhoneController.text} ${tfPhoneController.text}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                MyElevatedButton(
                                  onTap: () {
                                    Navigator.pop(context);
                                    FocusScope.of(context).unfocus();
                                    setState(() {
                                      pageNum = 3;
                                    });
                                  },
                                  text: "Yes",
                                ),
                                SizedBox(height: 12),
                                MyOutlinedButton(
                                  onTap: () {
                                    Navigator.pop(context);
                                    FocusScope.of(context).unfocus();
                                  },
                                  text: "No",
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  : () {},
              text: "Sign Up",
              color: enableButtonRegistration
                  ? Color(0xFF304FFE)
                  : Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }

  Widget tab1() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Image.asset(
              "assets/images/intro_0.png",
              scale: 4,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              "Create Your Coinpay Account",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            "Coinpay is a powerful tool that allows you to easily send, recieve and track all your transactions.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          MyElevatedButton(
            onTap: () {
              setState(() {
                pageNum = 2;
              });
            },
            text: "Sign Up",
          ),
          SizedBox(height: 12),
          MyOutlinedButton(
            onTap: () {},
            text: "Log In",
          ),
          SizedBox(height: 42),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "By continuing you accept our\n",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Terms of Service",
                      style: TextStyle(
                        color: Color(0xFF304FFE),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                TextSpan(
                  text: " and ",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: Color(0xFF304FFE),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
