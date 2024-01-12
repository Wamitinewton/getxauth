import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class InternationalPhoneInput extends StatelessWidget {
  final String? Function(String?) validator;
  final TextEditingController phoneNumberController = TextEditingController();
  final Rx<PhoneNumber> phoneNumber = PhoneNumber().obs;
  InternationalPhoneInput({super.key, required this.validator});

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (value) {
        phoneNumberController.text;
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      ignoreBlank: true,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
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
