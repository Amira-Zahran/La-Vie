import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie_web/view/components/styles/colors.dart';
import 'package:lavie_web/view_model/cubit/states.dart';
import '../../../../../../view_model/cubit/home/home_cubit.dart';
import '../../../../../components/auth/auth_components.dart';
import '../forums.dart';


class AddForums extends StatefulWidget {
  const AddForums({Key? key}) : super(key: key);

  @override
  State<AddForums> createState() => _AddForumsState();
}

class _AddForumsState extends State<AddForums> {



  static showBlackSuccessSnackBar(BuildContext context, {String? title}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3,),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.red.withOpacity(0.7),
        content: Text(
          title ?? 'User Must Add All Information',
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return HomeCubit(); },
      child: BlocConsumer<HomeCubit, CubitStates>(
        listener: (context , state){
          if(state is AddForumSuccessState){
            navigateAndFinish(context, const Forums());
          }else if (state is AddForumErrorState){

            showBlackSuccessSnackBar(context);
          }
        },
        builder: (context , state){
          HomeCubit forums = HomeCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black,),
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.white,
              title: const Text('Create New Post',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 21,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            body: ListView(
              children: [
                SafeArea(
                  child: Padding(
                    padding:  const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: GestureDetector(
                            child: Stack(
                              children: [
                                Container(
                                  width: 136,
                                  height: 136,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 1,
                                      color: primary,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.add,
                                        color: primary,
                                      ),
                                      SizedBox(height: 15,),
                                      Text('Add Photo',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: primary
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: forums.postImage != null, //only visible when user add photo successfully
                                  child: Container(
                                    width: 135,
                                    height: 135,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5,),
                                      color: primary,
                                    ),
                                    child: Image.network('https://icon-library.com/images/gallery-app-icon/gallery-app-icon-19.jpg',
                                    fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            onTap: (){
                              forums.getImage();
                            },
                          ),
                        ),
                        const SizedBox(height: 13,),
                        const Text('Title',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: Color(0xff6F6F6F),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        SizedBox(
                          height: 46,
                          child: TextField(
                            controller: forums.titleController,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primary,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Color(0xff939393),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text('Description',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: Color(0xff6F6F6F),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Container(
                          margin: EdgeInsets.zero,
                          height: 130,
                          child: TextField(
                            controller: forums.descriptionController,
                            maxLines: 9999, // to make text field able to take size https://stackoverflow.com/questions/55781224/how-to-create-a-full-screen-textfield-in-flutter
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primary,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: lightBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 33,),
                        SizedBox(
                          height: 54,
                          child: TextButton(

                            onPressed: () async{
                            await forums.createPost(
                                  title: forums.titleController.text,
                                  description: forums.descriptionController.text,
                                postImage: 'data:image/jpeg;base64,${forums.postImage}',

                                  );


                            },
                            style: ButtonStyle(

                              backgroundColor: MaterialStateProperty.all(primary,), //https://stackoverflow.com/questions/50083390/create-a-button-with-rounded-border
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(color: Colors.white)
                                ),
                              ),

                            ),
                            child: const Text('Post',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
