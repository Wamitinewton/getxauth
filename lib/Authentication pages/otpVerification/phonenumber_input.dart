import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:test_project/Authentication%20pages/authcontrollers/auth_service.dart';
import 'package:test_project/common/components/intl_phone.dart';

class PhoneNumberInput extends StatelessWidget {
  final Rx<PhoneNumber> phoneNumber = PhoneNumber().obs;
  final TextEditingController phoneNumberController = TextEditingController();
  PhoneNumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone_android_outlined,
              color: Colors.blue,
              size: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Select a country below',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Make sure your phone number is correct',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InternationalPhoneInput(),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple)),
                onPressed: () {

                  String phoneNumber = phoneNumberController.text.trim();
                  Get.find<AuthController>().signInWithPhoneNumber(phoneNumber);
                  Get.toNamed('/otp');
                },
                child: const Text('Register now'))
          ],
        ),
      ),
    );
  }
}
