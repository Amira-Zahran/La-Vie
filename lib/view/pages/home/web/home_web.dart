import 'package:flutter/material.dart';

import '../../../components/styles/colors.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({Key? key}) : super(key: key);

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  int generalButton = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          //physics: ,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/3,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width*.5,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/leaves.png'),
                            fit: BoxFit.cover,
                            //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(onPressed: (){}, icon: const Icon(Icons.question_mark_outlined)),
                              const Text('data'),
                              const Text('', maxLines: 7,),
                              ElevatedButton(onPressed: (){}, child: const Text('')),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                      width: MediaQuery.of(context).size.width*.5,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.cover,
                          //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              Text('data'),
              SingleChildScrollView(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(''), fit: BoxFit.cover),),
                        ),
                        Text('data'),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(''))),
                        ),
                        Text('data'),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(''))),
                        ),
                        Text('data'),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(''))),
                        ),
                        Text('data'),
                      ],
                    ),
                  ],
                ),
              ),
              Text('data'),

            ],
          ),
        ),
    );
  }
}
