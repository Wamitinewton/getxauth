import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../common/components/intl_phone.dart';
import '../../common/components/text_form_field_validator.dart';
import '../authcontrollers/phone_service.dart';

class PhoneNumberInput extends StatelessWidget {
  final Rx<PhoneNumber> phoneNumber = PhoneNumber().obs;
  final TextEditingController phoneNumberController = TextEditingController();
  final PhoneAuthController controller = Get.put(PhoneAuthController());

  PhoneNumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 270,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/icon-education-115075-transparent-png.png'),
                          fit: BoxFit.cover)),
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
                InternationalPhoneInput(
                  validator: TextFormFieldValidator.validatePhoneNumber,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.purple)),
                          onPressed: () {
                            // String phoneNumber = phoneNumberController.text.trim();
                            controller
                                .verifyPhoneNumber(phoneNumberController.text);
                            Get.toNamed('/otp');
                          },
                          child: const Text('Register now')),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
