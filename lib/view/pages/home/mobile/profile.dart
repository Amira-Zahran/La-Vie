import 'package:flutter/material.dart';

import '../../../components/home_mobile/profile_component.dart';
import '../../../components/styles/colors.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/cover.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),),),
                child: ProfileWidget(
                  imagePath: 'assets/cover.png',
                  onClicked: () async {},
                ),
              ),

              const SizedBox(height: 24),
              const Text(
                'Amira Zahran',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 24),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * .9,
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black, backgroundColor: green,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              /*side: BorderSide(
                          color: Color(green),
                          width: 2,
                        ),*/
                            ),
                          ),
                          onPressed: (() {
                            setState(() {});
                          }),
                          child: Row(
                            children: const [
                              Image(image: AssetImage('assets/star.png'),
                                width: 38,
                                height: 38,),
                              //Icon(Icons.star, size: 25,color: ,),
                              SizedBox(width: 25,),
                              Text('You have 30 points',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 20),)
                            ],
                          ),),
                      ),
                      const SizedBox(height: 10,),
                      const Text('Edit Profile', textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      const SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width * .9,
                        padding: const EdgeInsets.all(10),
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: green, backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              side: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                          ),
                          onPressed: (() {
                            setState(() {});
                          }),
                          child: Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: darkGreen,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Icon(
                                  Icons.repeat_sharp, size: 20, color: Colors
                                    .white,),),
                              const SizedBox(width: 25,),
                              const Text('Change Name',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.black26,
                                    fontSize: 20), textAlign: TextAlign.left,),
                              const SizedBox(width: 25,),
                              const Icon(Icons.arrow_forward_sharp, size: 25,
                                color: darkGreen)
                            ],
                          ),),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .9,
                        padding: const EdgeInsets.all(10),
                        height: 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: green, backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              side: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                          ),
                          onPressed: (() {
                            setState(() {});
                          }),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: darkGreen,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Icon(
                                  Icons.repeat_sharp, size: 20, color: Colors
                                    .white,),),
                              const SizedBox(width: 10,),
                              const Text('Change Email',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.black26,
                                    fontSize: 20), textAlign: TextAlign.left,),
                              const SizedBox(width: 25,),
                              const Icon(Icons.arrow_forward_sharp, size: 25,
                                color: darkGreen)
                            ],
                          ),),
                      ),
                    ],
                  )),
            ]));
  }
}