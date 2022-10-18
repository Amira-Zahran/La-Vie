import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie_web/model/forums/forums_model.dart';
import 'package:lavie_web/view/components/home_mobile/home_component.dart';
import 'package:lavie_web/view/pages/home/mobile/leaf/add_forums/add_forums.dart';
import 'package:lavie_web/view/pages/home/mobile/navigation_bottom_bar.dart';
import 'package:lavie_web/view_model/cubit/home/fourms_cubit.dart';
import 'package:lavie_web/view_model/cubit/states.dart';

import '../../../../../model/forums/my_forums_model.dart';
import '../../../../components/auth/auth_components.dart';
import '../../../../components/styles/colors.dart';

class Forums extends StatefulWidget {
  const Forums({Key? key}) : super(key: key);

  @override
  State<Forums> createState() => _ForumsState();
}

class _ForumsState extends State<Forums> {

  int activeButton = 0;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return ForumsCubit()..getForums(); },
      child: BlocConsumer<ForumsCubit , CubitStates>(
          listener: (context , state){},
          builder: (context , state) {
            ForumsCubit forums = ForumsCubit.get(context);
            return DefaultTabController(
              length: 2,
              initialIndex: 1,
              child: Scaffold(
                backgroundColor: Colors.white,
                floatingActionButton: FloatingActionButton(onPressed: (){
                  navigateTo(context, const AddForums());
                },
                  backgroundColor: primary, child: const Icon(
                  Icons.add,
                ),
                ),
                appBar: AppBar(
                  leading: InkWell(
                      onTap: (){
                        navigateTo(context, const NavigationBottomBar());
                      },
                      child: const Icon(Icons.arrow_back_ios,),),
                  elevation: 0,
                  centerTitle: true,
                  iconTheme: const IconThemeData(
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                  title: const Text('Discussion Forums',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                body: Padding(
                  padding:  const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                color: const Color(0xffF8F8F8),
                                height: 46,
                                child: TextField(
                                  onTap: (){

                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    hintText: 'Search',
                                    hintStyle: const TextStyle(
                                      color: customGrey,
                                    ),
                                    prefixStyle: const TextStyle(
                                      color: Color(0xff979797),
                                    ),
                                    prefixIconConstraints:
                                    const BoxConstraints(minHeight: 17, minWidth: 17),
                                    prefixIcon: const Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Image(
                                        width: 17,
                                        height: 17,
                                        image: AssetImage('assets/images/Search.png'),
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 35,
                              child: customBtn(forColor: (activeButton == 0 ? lightBlack : primary), backColor: (activeButton == 0 ? primary : lightGrey), color: (activeButton == 0 ? primary : lightGrey), onPressed: ((){setState(() {activeButton = 0;});
                              }), text: 'All Forums', textColor: (activeButton == 0 ? Colors.white : darkGreyColor),),
                            ),
                            SizedBox(
                              width: 150,
                              height: 35,
                              child: customBtn(forColor: (activeButton == 1 ? lightBlack : primary), backColor: (activeButton == 1 ? Colors.white : lightGrey), color: (activeButton == 1 ? primary : lightGrey), onPressed: ((){setState(() {activeButton = 1;});
                              }), text: 'My Forums', textColor: (activeButton == 1 ? primary : darkGreyColor),),
                            ),
                          ],
                        )
                      ),
                      Expanded(
                        child: forums.forumModel?.data != null  ? activeButton == 0
                            ? buildForumItem(forums.forumModel)
                            : buildMyForumItem(forums.myForumModel!)
                            : const Center(child: CircularProgressIndicator(color: primary,),),
                      ),
                     ],),
                      ),
                  ),
            );
          },
      ),
    );
  }

Widget buildForumItem(ForumModel? forumModel) => ListView.separated(
    separatorBuilder: (context , index) => const SizedBox(height: 20,),
    scrollDirection: Axis.vertical,
    itemBuilder: (context , index) => Column(
      children: [
        Container(
          width: 380,
          height: 314,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding:  const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          //backgroundImage: NetworkImage(ForumsCubit.get(context).profileModel!.data.imageUrl,),
                          backgroundColor: primary,
                        ),
                        const SizedBox(width: 12,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text( '${forumModel.data![index].publisher!.firstName} ${forumModel.data![index].publisher!.lastName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text('A month ago',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff979797).withOpacity(0.84),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Text('${forumModel.data![index].title}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        color: primary,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text('${forumModel.data![index].description}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        fontFamily: 'Roboto',
                        color: Color(0xff8F8D8D),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    Flexible(
                      child: forumModel.data![index].imageUrl != ''  ? Image.network('https://lavie.orangedigitalcenteregypt.com${forumModel.data![index].imageUrl}',
                        width: double.infinity  ,
                        fit: BoxFit.cover,) : Image.network('https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1623959191-medium-plant-dieffenbachia-white-pot_2048x.jpg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:  const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              const Icon(Icons.thumb_up_alt_outlined,
                size: 20,
                color: Color(0xff666565),
              ),
              const SizedBox(width: 5,),
              Text('${forumModel.data![index].forumLikes!.length} Likes',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(.6),
                ),
              ),
              const SizedBox(width: 40,),
              Text(' ${forumModel.data![index].forumComments!.length} replies',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(.6),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    itemCount: forumModel!.data!.length,
);

Widget buildMyForumItem(MyForumModel? myForumModel) => ListView.separated(
  separatorBuilder: (context , index) => const SizedBox(height: 20,),
  scrollDirection: Axis.vertical,
  itemBuilder: (context , index) => Column(
    children: [
      Container(
        width: 380,
        height: 314,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding:  const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        //backgroundImage: NetworkImage(ForumsCubit.get(context).profileModel!.data.imageUrl,),
                        backgroundColor: primary,
                      ),
                      const SizedBox(width: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( '${myForumModel.data[index].user.firstName} ${myForumModel.data[index].user.lastName}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text('A month ago',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff979797).withOpacity(0.84),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text(myForumModel.data[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      color: primary,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(myForumModel.data[index].description,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      fontFamily: 'Roboto',
                      color: Color(0xff8F8D8D),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  Flexible(
                    child: myForumModel.data[index].imageUrl != ''  ? Image.network('https://lavie.orangedigitalcenteregypt.com${myForumModel.data[index].imageUrl}',
                      width: double.infinity  ,
                      fit: BoxFit.cover,) : Image.network('https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1623959191-medium-plant-dieffenbachia-white-pot_2048x.jpg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding:  const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            const Icon(Icons.thumb_up_alt_outlined,
              size: 20,
              color: Color(0xff666565),
            ),
            const SizedBox(width: 5,),
            Text('${myForumModel.data[index].ForumLikes.length} Likes',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            const SizedBox(width: 40,),
            Text(' ${myForumModel.data[index].ForumComments.length} replies',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(.6),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
  itemCount: myForumModel!.data.length,
);

}
