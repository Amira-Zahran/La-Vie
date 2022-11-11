import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CustomAbout extends StatelessWidget {
  const CustomAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 100),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('About us', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        color: Colors.black,
                        height: 2,
                        width: 50,
                      )                    ],
                  ),
                  const SizedBox(
                      width: 500,
                      child: Text("Welcome to La Vie, your number one source for planting. We're dedicated to giving you the very best of plants, with a focus on dependability, customer service and uniqueness. Founded in 2020, La Vie has come a long way from its beginnings in a  home office our passion for helping people and give them some advices about how to plant and take care of plants. We now serve customers all over Egypt, and are thrilled to be a part of the eco-friendly wing ",
                        maxLines: 8,)
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Stack(
                  children: [
                    const SizedBox(
                      width: 200,
                      height: 200,
                    ),
                    Positioned(
                      top: 30,
                      left: 20,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                                width: 3,
                                color: primary
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(image: AssetImage('assets/images/success.png'),
                              fit: BoxFit.cover),),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/images/mobileApp.png', width: 300, height: 300,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('Mobile Application', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                                Container(
                                  margin: const EdgeInsets.only(top: 10, left: 10),
                                  color: Colors.black,
                                  height: 2,
                                  width: 50,
                                )                              ],
                            ),
                            const SizedBox(
                                width: 700,
                                child: Text("You can install La Vie mobile application and enjoy with new features, earn more points and get discountsAlso you can scan QR codes in your plants’ pots so that you can get discount on everything in the website up to 70%",
                                  maxLines: 4,)
                            ),
                          ],
                        ),
                        const Text('Install by', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 180,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextButton(
                                onPressed: (){
                                  // navigateTo(context, SignUp());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/images/play.png',width: 12, height: 20,),
                                    const Text('Play Store', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Container(
                              width: 180,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextButton(
                                onPressed: (){
                                  // navigateTo(context, SignUp());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/images/app.png',width: 12, height: 20,),
                                    const Text('App Store', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
