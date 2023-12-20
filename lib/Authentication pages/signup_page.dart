import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Authentication pages/auth_service.dart';
import 'package:test_project/common/components/formfield_builder.dart';

import '../common/components/text_form_field_validator.dart';

class SignUpScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    "Are you new? Create an account with us",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Icon(
                  Icons.school,
                  size: 170,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                FormFieldType(
                  labelText: 'username',
                  hintText: 'Enter your username',
                  controller: usernameController,
                  obscureText: false,
                  validator: TextFormFieldValidator.validateUsername,
                  onChanged: (value) =>
                      _authController.usernameController.text = value,
                ),
                const SizedBox(
                  height: 15,
                ),
                FormFieldType(
                  labelText: 'Email',
                  hintText: 'Enter your email address',
                  controller: emailController,
                  obscureText: false,
                  validator: TextFormFieldValidator.validateEmail,
                  onChanged: (value) =>
                      _authController.emailController.text = value,
                ),
                const SizedBox(
                  height: 15,
                ),
                FormFieldType(
                  labelText: 'password',
                  hintText: 'Enter your password',
                  controller: passwordController,
                  obscureText: true,
                  validator: TextFormFieldValidator.validatePassword,
                  onChanged: (value) =>
                      _authController.passwordController.text = value,
                ),
                const SizedBox(
                  height: 15,
                ),
                FormFieldType(
                  labelText: 'confirm password',
                  hintText: 'confirm your password',
                  controller: confirmPasswordController,
                  obscureText: true,
                  validator: TextFormFieldValidator.validateConfirmPassword,
                  onChanged:(value) => _authController.confirmPasswordController.text = value,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _authController.signUp(
                          emailController.text,
                          passwordController.text,
                          confirmPasswordController.text,
                          usernameController.text);
                          
                    }
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),

                SizedBox(height: 40,),
             
             Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text('Already have an account?...', style: TextStyle(
                        fontSize: 18,
                      ),),
                    ),
                      Padding(
                       padding: const EdgeInsets.only(right: 45),
                       child: ElevatedButton(
                        
                         onPressed: (){
                          Get.toNamed('/login');
                         },
                         child: const Text('Sign in', style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                                         ),),
                       ),
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
