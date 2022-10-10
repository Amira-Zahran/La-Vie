import 'package:flutter/material.dart';
import 'package:lavie_web/view/components/styles/colors.dart';

import '../../../../../../model/home/questions_model.dart';
import 'options.dart';


class QuizQuestions extends StatefulWidget {
  const QuizQuestions({Key? key}) : super(key: key);

  @override
  State<QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions> {
  final PageController controller = PageController();
  int questionNumber = 1;
  int currentIndex = 0;


  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.page?.round() != currentIndex) {
        setState(() {
          currentIndex = controller.page!.round();
        });
      }
    });
  }
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Course Exam',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 19,
            color: Colors.black,
          ),
        ),
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: 10,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context , index) => Padding(
          padding: const EdgeInsets.all(31.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Question ' ,
                  style: const TextStyle(color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 36,

                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '$questionNumber',
                      style: const TextStyle(color: primary,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 36,

                      ),
                    ),
                    TextSpan(
                      text: '${questions.length}',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        letterSpacing:1,
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              SizedBox(
                height: 50,
                child: PageView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context , index){
                    final _questions = questions[index];
                    return buildQuestions(_questions);
                  },
                  physics: const NeverScrollableScrollPhysics(),

                ),
              ),
              Align(
                child:buildElevautedButton(),
                alignment: Alignment.bottomRight,
              ),
              const SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }

  Column buildQuestions(Questions question) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question.text,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 32,),
        Options(),
      ],
    );
  }

  buildElevautedButton(){
    return Container(
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(10),

      ),
      clipBehavior: Clip.hardEdge,
      width: 172,
      height: 43,
      child: MaterialButton(
        textColor: Colors.white,
        onPressed: (){
          if(questionNumber < questions.length){
            controller.nextPage(
              duration : const Duration(milliseconds: 250,),
              curve: Curves.easeInExpo,

            );
            setState(() {
              questionNumber++;
            });
          }else{
            //navigateAndFinish(context, LayOutScreen());
          }
        }, child: Text(
        questionNumber <questions.length ? 'Next': 'See the result',
      ),),
    );
  }
}

