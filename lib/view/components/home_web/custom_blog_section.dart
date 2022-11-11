import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CustomBlogSection extends StatelessWidget {
  const CustomBlogSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 100),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              const Text('Blogs', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                color: Colors.black,
                height: 2,
                width: 50,
              )            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/imgBox.png'), fit: BoxFit.cover),),
                    ),
                    const Text('2 days ago', style: TextStyle(color: primary, fontSize: 12)),
                    const Text('5 Simple Tips treat plant', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
                    const Text('leaf, in botany, any usually flattened green \n outgrowth from the stem of', style: TextStyle(color: darkGreyColor, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
