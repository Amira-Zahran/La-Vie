import 'package:flutter/material.dart';

import '../../pages/home/mobile/home/quiz/quiz_questions.dart';
import '../auth/auth_components.dart';
import '../styles/colors.dart';

class CustomHome extends StatelessWidget {
  const CustomHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(
            width: 440,
            height: 700,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/leaves.png'),
                  fit: BoxFit.cover,
                  //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 200,
              height: MediaQuery.of(context).size.height/2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png',),
                  fit: BoxFit.cover,
                  //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('Answer some questions and get points'),
                        InkWell(
                          onTap: (){
                            navigateAndFinish(context, const QuizQuestions());
                          },
                          child: Visibility( // show or hide widget
                            //visible: (dateFormat == 'Monday') ? true : false,
                            child: Container(
                              margin: EdgeInsets.only(top: 20, left: MediaQuery.of(context).size.width *.8),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(color: primary,borderRadius: BorderRadius.circular(30)),
                              child: const Icon(
                                Icons.question_mark,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('Perfect way to plant in house', style: TextStyle(color: primary, fontSize: 25),),
                        const SizedBox(
                            width: 350,
                            child: Text('leaf, in botany, any usually flattened green outgrowth from the stem of a vascular plant. As the primary sites of photosynthesis, leaves manufacture food for plants, which in turn ultimately nourish and sustain all land animals. Botanically, leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients, water, and end products of photosynthesis',
                              maxLines: 8,)),

                        ElevatedButton(onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primary,
                              side: const BorderSide(width: 50)
                          ), child: const Text('Explore Now', style: TextStyle(color: Colors.white,)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
