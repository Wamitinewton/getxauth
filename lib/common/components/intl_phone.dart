import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class InternationalPhoneInput extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();
  final Rx<PhoneNumber> phoneNumber = PhoneNumber().obs;
   InternationalPhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber value) {
                  phoneNumber.value = value;
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(
                  color: Colors.black,
                ),
                textStyle: const TextStyle(
                  color: Colors.black,
                ),
                initialValue: phoneNumber.value,
                textFieldController: phoneNumberController,
                inputDecoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'phone Number'),
              );
  }
}