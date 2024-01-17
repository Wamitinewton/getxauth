import 'package:flutter/material.dart';
import 'package:test_project/common/components/featured_text.dart';

class CourseChoice
 extends StatelessWidget {
  const CourseChoice
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FeaturedText(
                          text: 'Featured',
                          onTap: () {},
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          textColor: Colors.black),
        
                          FeaturedText(
                          text: 'Top',
                          onTap: () {},
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          textColor: Colors.black),
        
                          FeaturedText(
                          text: 'Latest',
                          onTap: () {},
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          textColor: Colors.black),
        
                          FeaturedText(
                          text: 'For you',
                          onTap: () {},
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          textColor: Colors.black),
        
                          FeaturedText(
                          text: 'Premium',
                          onTap: () {},
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          textColor: Colors.black),
                    ],
                  ),
      ),
    );
  }
}