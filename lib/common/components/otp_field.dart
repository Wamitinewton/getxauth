import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpFormField extends StatelessWidget {
   final TextEditingController otpController = TextEditingController();
  final ValueChanged<String>? onChanged;
   OtpFormField({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 68,
      width: 68,
      child: TextFormField(
        controller: otpController,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.headlineMedium,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
