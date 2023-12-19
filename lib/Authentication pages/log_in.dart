import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Authentication%20pages/auth_service.dart';
import 'package:test_project/common/components/formfield_builder.dart';
import 'package:test_project/common/components/text_form_field_validator.dart';

class LogInScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LogInScreen({Key? key}) : super(key: key);

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
                    'Welcome back . We have missed you',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Icon(
                  Icons.lock,
                  size: 150,
                ),
                const SizedBox(
                  height: 40,
                ),
        
                FormFieldType(
                  labelText: 'Email',
                  hintText: 'wamitinewton@example.com',
                  controller: emailController,
                  obscureText: false,
                  validator: TextFormFieldValidator.validateEmail, onChanged: null,
                ),
        
                const SizedBox(
                  height: 15,
                ),
                FormFieldType(
                  labelText: 'password',
                  hintText: 'Enter your password',
                  controller: passwordController,
                  obscureText: true,
                  validator: TextFormFieldValidator.validatePassword, onChanged: null,
                ),
                const SizedBox(height: 15,),
                // FormFieldBuilder(labelText: 'password', hintText: 'Enter your password', controller: emailController, obscureText: true, validator: TextFormFieldValidator.validatePassword),
                const Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'forgot your password?',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _authController.signIn(
                            emailController.text, passwordController.text);
                      }
                    },
                    child: const Text('Sign In', style: TextStyle(
                      fontSize: 20,
                    ),)),
                const SizedBox(
                  height: 25,
                ),
        
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text('Don\'t have an account?...', style: TextStyle(
                        fontSize: 18,
                      ),),
                    ),
                      Padding(
                       padding: const EdgeInsets.only(right: 45),
                       child: ElevatedButton(
                        
                         onPressed: (){
                          Get.toNamed('/signup');
                         },
                         child: const Text('Sign up', style: TextStyle(
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
