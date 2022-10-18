import 'package:flutter/material.dart';
import 'package:lavie_web/view/components/auth/auth_components.dart';
import 'package:lavie_web/view/pages/home/mobile/home/cart.dart';
import 'package:lavie_web/view/pages/home/mobile/profile.dart';
import '../../../components/styles/colors.dart';
import '../mobile/home/quiz/quiz_questions.dart';
import '../mobile/leaf/add_forums/add_forums.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({Key? key}) : super(key: key);

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  int generalButton = 0;

  PageController controller = PageController();

  List<String> list = ['Home','Shop', 'Blog', 'About', 'Community'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
              scrollDirection: Axis.vertical,
              pageSnapping: false,
              controller: controller,
            children: List.generate(list.length, (index) {
              return Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: Image.asset('assets/logo.png',
                            width: 80,
                            height: 100,
                          ),
                        ),
                        Row(
                            children: List.generate(4, (index) => InkWell(
                              onTap: (){
                                _scrollToIndex(index);
                                setState(() {
                                  generalButton = 1;
                                  generalButton = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 150),
                                child: Text(list[index], style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: (generalButton == index ? primary : Colors.black
                                    )),),
                              ),
                            ),)
                        ),
                        InkWell(
                          onTap: (){
                            navigateTo(context, const AddForums());
                            generalButton = 5;
                          },
                          child: Text('Community', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: (generalButton == 5 ? primary : Colors.black)
                          ),),
                        ),
                        Row(
                          children: [
                            IconButton(onPressed: (){
                              navigateTo(context, const Cart());
                            }, icon: const Icon(Icons.shopping_cart_outlined)),
                            IconButton(onPressed: (){

                            }, icon: const Icon(Icons.notifications_none_rounded)),
                            IconButton(onPressed: (){
                              navigateTo(context, const Profile());
                            }, icon: const CircleAvatar(backgroundImage: AssetImage('assets/images/profile_blur.png'),))
                          ],
                        )
                      ],
                    ),
                  ),
                  index == 1 ? Row(
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
                  )
                  : index == 2 ? Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text('Popular', style: TextStyle(color: Colors.black, fontSize: 25)),
                              Divider(thickness: 5, color: Colors.black, )
                            ],
                          ),
                          const Text('Categories', style: TextStyle(color: Colors.black, fontSize: 25))
                        ],
                      ),
                      SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(image: AssetImage('assets/images/pop.png'), fit: BoxFit.cover),),
                                ),
                                const Text('Tools', style: TextStyle(color: Colors.black, fontSize: 17)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: const [
                          Text('Best seller', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                          Divider(thickness: 5, color: Colors.black, )
                        ],
                      ),
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
                                Text('SPIDER PLANT', style: TextStyle(color: Colors.black, fontSize: 17)),
                                Text('190 EGP', style: TextStyle(color: Colors.black, fontSize: 25,)),
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
                                Text('SPIDER PLANT', style: TextStyle(color: Colors.black, fontSize: 17)),
                                Text('190 EGP', style: TextStyle(color: Colors.black, fontSize: 25,)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                  : index == 3 ? Column(
                    children: [
                      Row(
                        children: const [
                          Text('Blogs', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                          Divider(thickness: 5, color: Colors.black, )
                        ],
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
                  )
                  : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text('About us', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                                  Divider(thickness: 5, color: Colors.black, )
                                ],
                              ),
                              const SizedBox(
                                  width: 500,
                                  child: Text("Welcome to La Vie, your number one source for planting. We're dedicated to giving you the very best of plants, with a focus on dependability, customer service and uniqueness. Founded in 2020, La Vie has come a long way from its beginnings in a  home office our passion for helping people and give them some advices about how to plant and take care of plants. We now serve customers all over Egypt, and are thrilled to be a part of the eco-friendly wing ",
                                    maxLines: 8,)
                              ),
                            ],
                          ),
                          Stack(
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
                                          children: const [
                                            Text('Mobile Application', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                                            Divider(thickness: 5, color: Colors.black, )
                                          ],
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
                          Container(
                            color: darkGreyColor,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height/4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: Image.asset('assets/logo.png',
                                        width: 80,
                                        height: 100,
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Text('LA VIE ', style: TextStyle(color: primary, fontWeight: FontWeight.bold)),
                                        Text("We're dedicated to giving you the"),
                                      ],
                                    ),
                                    const Text("very best of plants, with a focus on dependability",
                                      maxLines: 2,),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text('SECTIONS', style: TextStyle(color: primary, fontSize: 20, fontWeight: FontWeight.bold)),
                                    Text('Home \n Category \n New \n Request To Be Seller'),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text('CONTACT US', style: TextStyle(color: primary, fontSize: 20, fontWeight: FontWeight.bold)),
                                    Text('Phone 01244522323 \n Phone 01331920394 \n Email : rawan@gmail.com \n Address : 6 October city ,Giza ,egypt'),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text('SIGN FOR OUR NEWSLETTER \n AND GET A 10% DISCOUNT', style: TextStyle(color: primary, fontSize: 20, fontWeight: FontWeight.bold)),
                                    Row(children: [
                                      /*TextFormField(
                                      ),*/
                                      ElevatedButton(onPressed: (){}, child: const Text('SUBMIT'))
                                    ],
                                    ),
                                    const Text('OUR SOCIAL', style: TextStyle(color: primary, fontSize: 20, fontWeight: FontWeight.bold)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(onPressed: (){}, icon: const Icon(Icons.facebook)),
                                        IconButton(onPressed: (){}, icon: const Icon(Icons.install_desktop)),
                                        IconButton(onPressed: (){}, icon: const Icon(Icons.border_inner_rounded)),
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
                  )
                  //const SizedBox(height: 50,),
                ],
              );
            })
          ),
    );
  }



  void _scrollToIndex(int index) {
    controller.animateToPage(index + 1, duration: const Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
  }
}
