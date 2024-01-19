import 'package:flutter/material.dart';
import 'package:igniteiq/common/components/bottombar_util.dart';
import 'package:igniteiq/common/components/circle_avatar.dart';
import 'package:igniteiq/common/components/course_choice.dart';
import 'package:igniteiq/common/components/featured_text.dart';
import 'package:igniteiq/common/components/formfield_builder.dart';
import 'package:igniteiq/common/components/pageview_builder.dart';
// ignore: must_be_immutable
class StudentHomeScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController filterController = TextEditingController();
 

  StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 135, 231, 138),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hello Student',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                          color: Colors.blue,
                          fontStyle: FontStyle.italic),
                    ),
                    Row(
                      children: [
                        ProfileAvatar(),
                        const SizedBox(
                          width: 11,
                        ),
                        const Icon(
                          Icons.notifications_rounded,
                          size: 35,
                          color: Colors.purple,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 328,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14.4),
                      child: Image.asset(
                        'assets/icons/person1.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FormFieldType(
                  labelText: 'Search',
                  hintText: 'Search for courses',
                  controller: filterController,
                  obscureText: false,
                  onChanged: null,
                  suffixIcon: Icons.search,
                  onSuffixIconTap: () {}),
              const SizedBox(
                height: 20,
              ),
              const CourseChoice(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: PageBuilderView(),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FeaturedText(
                        text: 'Recently viewed',
                        onTap: () {},
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        textColor: Colors.black),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: PageBuilderView(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, -3))
            ]),
        child: BottomNavBarUtil.buildBottomNavBar(),
      ),
    );
  }

  
}
