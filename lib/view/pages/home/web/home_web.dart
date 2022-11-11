import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../../../../core/resource/style_manager.dart';
import '../../../components/auth/auth_components.dart';
import '../../../components/home_web/custom_about.dart';
import '../../../components/home_web/custom_blog_section.dart';
import '../../../components/home_web/custom_home.dart';
import '../../../components/home_web/custom_shop_section.dart';
import '../../../components/styles/colors.dart';
import '../mobile/home/cart.dart';
import '../mobile/leave/add_forums/add_forums.dart';
import '../mobile/profile.dart';


class HomeWeb extends StatefulWidget {
  const HomeWeb({Key? key}) : super(key: key);

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {

  ScrollController myController = ScrollController();
  final homeKey = GlobalKey();
  final shopSectionKey = GlobalKey();
  final blogSectionKey = GlobalKey();
  final aboutSectionKey = GlobalKey();

  void scrollToTop({required itemKey}) {
    final object = itemKey.currentContext!.findRenderObject();
    myController.position.ensureVisible(
      object!,
      alignment: .2,
      duration: const Duration(seconds: 2),
    );
  }

  int generalButton = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
            length: 4,
            child: SingleChildScrollView(
                controller: myController,
                child: Column(
                  children: [
                    StickyHeader(
                      header: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: Image.asset('assets/logo.png',
                              width: 80,
                              height: 100,
                            ),
                          ),
                          TabBar(
                            indicatorColor: Colors.transparent,
                            onTap: (index) {
                              if (index == 0) {
                                scrollToTop(itemKey: homeKey);
                              } else if (index == 1) {
                                scrollToTop(
                                    itemKey: shopSectionKey);
                              }else if (index == 2) {
                                scrollToTop(
                                    itemKey: blogSectionKey);
                              } else if (index == 3) {
                                scrollToTop(
                                    itemKey: aboutSectionKey);
                              }
                            },
                            isScrollable: true,
                            padding: const EdgeInsets.only(left: 101),
                            //indicatorSize: TabBarIndicatorSize.label,
                            unselectedLabelColor: Colors.black,
                            /*unselectedLabelStyle: getRegularStyle(
                              color: const Color(0xffBAB1B8),
                              fontSize: 18,
                            ),*/
                            labelStyle: getBoldStyle(
                              color: primary,
                              fontSize: 18,
                            ),
                            labelColor: primary,
                            tabs: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  'Home',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  'Shop',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  'Blog',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  'About',
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              navigateTo(context, const AddForums());
                              generalButton = 5;
                            },
                            child: Text('Community', style: getBoldStyle(
                              fontSize: 18,
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
                      content: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            const CustomHome(),
                            Container(
                              color: Colors.white,
                              height: 100,
                              key: shopSectionKey,
                            ),
                            const CustomShopSection(),
                            Container(
                              color: Colors.white,
                              height: 100,
                              key: blogSectionKey,
                            ),
                            const CustomBlogSection(),
                            Container(
                              color: Colors.white,
                              height: 100,
                              key: aboutSectionKey,
                            ),
                            const CustomAbout(),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
