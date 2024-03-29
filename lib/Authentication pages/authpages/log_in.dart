import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/components/formfield_builder.dart';
import '../../common/components/text_form_field_validator.dart';
import '../authcontrollers/auth_service.dart';

// ignore: must_be_immutable
class LogInScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  RxBool showPassword = true.obs;

  LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 270,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/person2.jpg'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Welcome back . We have missed you',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 15,
                ),

                FormFieldType(
                  labelText: 'Email',
                  hintText: 'wamitinewton@example.com',
                  controller: emailController,
                  obscureText: false,
                  validator: TextFormFieldValidator.validateEmail,
                  onChanged: emailController.obs.call,
                  suffixIcon: Icons.clear,
                  onSuffixIconTap: () {
                    emailController.clear();
                  },
                ),

                const SizedBox(
                  height: 6,
                ),
                FormFieldType(
                  labelText: 'password',
                  hintText: 'Enter your password',
                  controller: passwordController,
                  obscureText: showPassword.value,
                  validator: TextFormFieldValidator.validatePassword,
                  onChanged: passwordController.obs.call,
                  suffixIcon: Icons.remove_red_eye,
                  onSuffixIconTap: () {
                    showPassword.toggle();
                  },
                ),
                const SizedBox(
                  height: 6,
                ),
                // FormFieldBuilder(labelText: 'password', hintText: 'Enter your password', controller: emailController, obscureText: true, validator: TextFormFieldValidator.validatePassword),
                const Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'forgot your password?',
                        style: TextStyle(color: Colors.amber),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.purple)),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _authController.signIn(
                            emailController.text, passwordController.text);
                      }
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                const SizedBox(
                  height: 25,
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?...',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.purple)),
                        onPressed: () {
                          Get.toNamed('/signup');
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
