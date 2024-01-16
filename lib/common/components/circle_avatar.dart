import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: 60,
          height: 60,
          child: ClipOval(
            child: Image.asset('/home/newton/Desktop/flutter projects/test_project/assets/images/elearning-ecdl-akadimos.jpg'),
          ),
        ),
      ),
        );
  }
}
