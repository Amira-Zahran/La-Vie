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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                      width: 200,
                        height: 800,
                        decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/background.png',),
                          fit: BoxFit.cover,
                          //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                        ),
                      ),
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: Image.asset('assets/logo.png',
                                      width: 80,
                                      height: 100,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        generalButton = 0;
                                      });
                                    },
                                    child: Text('Home', style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: (generalButton == 0 ? primary : Colors.black
                                        )),),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        generalButton = 1;
                                      });
                                    },
                                    child: Text('Shop', style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: (generalButton == 1 ? primary : Colors.black
                                        )),),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        generalButton = 2;
                                      });
                                    },
                                    child: Text('Blog', style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: (generalButton == 2 ? primary : Colors.black
                                        )),),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        generalButton = 3;
                                      });
                                    },
                                    child: Text('About', style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: (generalButton == 3 ? primary : Colors.black
                                        )),),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        generalButton = 4;
                                      });
                                    },
                                    child: Text('Community', style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: (generalButton == 4 ? primary : Colors.black
                                        )),),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_outlined)),
                                      IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none_rounded)),
                                      IconButton(onPressed: (){}, icon: const CircleAvatar(backgroundImage: AssetImage('assets/images/profile_blur.png'),))
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  const SizedBox(width: 400,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Text('jdddd'),
                                          IconButton(onPressed: (){}, icon: const Icon(Icons.question_mark_outlined)),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Text('Perfect way to plant in house'),
                                          const SizedBox(
                                              width: 350,
                                              child: Text('leaf, in botany, any usually flattened green outgrowth from the stem of a vascular plant. As the primary sites of photosynthesis, leaves manufacture food for plants, which in turn ultimately nourish and sustain all land animals. Botanically, leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients, water, and end products of photosynthesis',
                                                maxLines: 8,)),

                                          ElevatedButton(onPressed: (){}, child: const Text('Explore Now')),
                                        ],
                                      ),
                                    ],
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
              const Text('Popular\n Categories'),
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pop.png'), fit: BoxFit.cover),),
                        ),
                        const Text('w'),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pop.png'), fit: BoxFit.cover),),
                        ),
                        const Text('w'),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pop.png'), fit: BoxFit.cover),),
                        ),
                        const Text('w'),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pop.png'), fit: BoxFit.cover),),
                        ),
                        const Text('w'),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pop.png'), fit: BoxFit.cover),),
                        ),
                        const Text('w'),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/pop.png'), fit: BoxFit.cover),),
                        ),
                        const Text('w'),
                      ],
                    ),
                  ],
                ),
              ),
              const Text('Best seller'),
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                            width: 200,
                            height: 200,
                            child: Image(image: AssetImage('assets/images/imgBox.png'))),
                        Text('name'),
                        Text('190 EGP'),
                        SizedBox(height: 150,)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(height: 150,),
                        SizedBox(
                            width: 200,
                            height: 200,
                            child: Image(image: AssetImage('assets/images/imgBox.png'))),
                        Text('name'),
                        Text('190 EGP'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                            width: 200,
                            height: 200,
                            child: Image(image: AssetImage('assets/images/imgBox.png'))),
                        Text('name'),
                        Text('190 EGP'),
                        SizedBox(height: 150,)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(height: 150,),
                        SizedBox(
                            width: 200,
                            height: 200,
                            child: Image(image: AssetImage('assets/images/imgBox.png'))),
                        Text('name'),
                        Text('190 EGP'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                            width: 200,
                            height: 200,
                            child: Image(image: AssetImage('assets/images/imgBox.png'))),
                        Text('name'),
                        Text('190 EGP'),
                        SizedBox(height: 150,)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(height: 150,),
                        SizedBox(
                            width: 200,
                            height: 200,
                            child: Image(image: AssetImage('assets/images/imgBox.png'))),
                        Text('name'),
                        Text('190 EGP'),
                      ],
                    ),

                  ],
                ),
              ),
              const Text('Blogs'),
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
                      const Text('name'),
                      const Text('name'),
                      const Text('190 EGP'),
                    ],
                  ),
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/imgBox.png'), fit: BoxFit.cover),),
                        ),
                        const Text('name'),
                        const Text('name'),
                        const Text('190 EGP'),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/imgBox.png'), fit: BoxFit.cover),),
                        ),
                        const Text('name'),
                        const Text('name'),
                        const Text('190 EGP'),
                      ],
                    ),),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/imgBox.png'), fit: BoxFit.cover),),
                        ),
                        const Text('name'),
                        const Text('name'),
                        const Text('190 EGP'),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/imgBox.png'), fit: BoxFit.cover),),
                        ),
                        const Text('name'),
                        const Text('name'),
                        const Text('190 EGP'),
                      ],
                    ),),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/imgBox.png'), fit: BoxFit.cover),),
                        ),
                        const Text('name'),
                        const Text('name'),
                        const Text('190 EGP'),
                      ],
                    ),),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const Text('About us'),
                      const SizedBox(
                          width: 200,
                          child: Text("Welcome to La Vie, your number one source for planting. We're dedicated to giving you the very best of plants, with a focus on dependability, customer service and uniqueness. Founded in 2020, La Vie has come a long way from its beginnings in a  home office our passion for helping people and give them some advices about how to plant and take care of plants. We now serve customers all over Egypt, and are thrilled to be a part of the eco-friendly wing ",
                          maxLines: 8,)
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: primary),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
    );
  }
}
