import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Authentication%20pages/authcontrollers/phone_service.dart';
import 'package:test_project/common/components/otp_field.dart';

class OtpVerificationScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  final PhoneAuthController controller = Get.find();


  OtpVerificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 7, top: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {
                        Get.toNamed('/login');
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Verification code',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'We have sent a verification code to your phone',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/phone');
                },
                child: const Text(
                  'Change phone number?',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 4; i++)
                        OtpFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple)),
                onPressed: () {
                  // controller.verifyOTP(verificationId);
                },
                child: const Text(
                  "Verify",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
