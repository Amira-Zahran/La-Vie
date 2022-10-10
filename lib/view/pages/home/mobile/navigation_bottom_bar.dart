import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie_web/view/components/styles/colors.dart';
import 'package:lavie_web/view/pages/home/mobile/home/home_mobile.dart';
import 'package:lavie_web/view_model/cubit/home/home_cubit.dart';
import 'package:lavie_web/view_model/cubit/states.dart';
import 'Qr_Code_Scanner.dart';
import 'leaf/forums.dart';
import 'notification.dart';
import 'profile.dart';


class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({Key? key}) : super(key: key);

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {


/*  fetchData()async{
   // await HomeCubit.get(context).getUserData();
    await HomeCubit.get(context).getProducts();
  *//*  await   AppCubit.get(context).getPlanets();
    await  AppCubit.get(context).getSeeds();
    await  AppCubit.get(context).getTools();*//*
  }
  @override
  void initState() {
    fetchData();
    super.initState();
  }*/

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return HomeCubit(); },
      child: BlocConsumer<HomeCubit, CubitStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          HomeCubit myCubit = HomeCubit.get(context);
          final items = [
            Image(image: const AssetImage('assets/images/leave.png') , width: 24, height: 24, color: myCubit.currentIndex == 0 ? Colors.white : Colors.black,),
            Image(image: const AssetImage('assets/images/qr.png') , width: 24, height: 24, color: myCubit.currentIndex == 1 ? Colors.white : Colors.black,),
            Image(image: const AssetImage('assets/images/home.png') , width: 24, height: 24, color: myCubit.currentIndex == 2 ? Colors.white : Colors.black,),
            Image(image: AssetImage(myCubit.currentIndex == 3 ? 'assets/images/Bell.png' : 'assets/images/bell2.png' ,) , width: 24, height: 24, color: myCubit.currentIndex == 3 ? Colors.white :  null),
            Image(image: const AssetImage('assets/images/profile.png') , width: 24, height: 24, color: myCubit.currentIndex == 4 ? Colors.white : Colors.black,),
          ];

          return SafeArea(
            //top: false,
              child: ClipRect(
                child: Scaffold(
                  body: myCubit.screens[myCubit.currentIndex],
                  extendBody: true,
                  bottomNavigationBar: Theme(
                    data: Theme.of(context).copyWith(
                      iconTheme: const IconThemeData(color: Colors.black,),
                    ),
                    child: /*index == 0 || index == 1 || index == 4 ? Container() :*/ CurvedNavigationBar(
                      onTap: (index){
                        setState(() {
                          myCubit.currentIndex = index;
                        });
                      },
                      items: items,
                      key: navigationKey,
                      height: 60,
                      index: myCubit.currentIndex,
                      color: Colors.white,
                      backgroundColor: Colors.transparent,
                      buttonBackgroundColor: primary,
                      animationCurve: Curves.easeInOut,
                      animationDuration: const Duration(milliseconds: 300),
                    ),
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}

//Badge()
