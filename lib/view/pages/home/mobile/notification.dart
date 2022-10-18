import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie_web/view/components/styles/colors.dart';


import '../../../../model/forums/forums_model.dart';
import '../../../../view_model/cubit/home/home_cubit.dart';
import '../../../../view_model/cubit/states.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return HomeCubit()..getForums(); },
      child: BlocConsumer<HomeCubit, CubitStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          HomeCubit forums = HomeCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0.0,
              title: const Text(
                'Notification',
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            body: forums.forumModel?.data == null
                ? const Center(child: CircularProgressIndicator(color: primary,))
                : notificationLikeComment(forums.forumModel!),
          );
        },
      ),
    );
  }

  Widget notificationLikeComment (ForumModel? forumModel){
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            mainAxisExtent: 100
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16),
              child: forumModel!.data![index].forumLikes!.length > 10
                  ? Column(
                children: [
                  Row(
                    crossAxisAlignment : CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://lavie.orangedigitalcenteregypt.com${forumModel.data![index].imageUrl.toString()}'),
                        radius: 16.0,
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        children: [
                          Text('${forumModel.data![index].publisher!.firstName} ${forumModel.data![index].publisher!.lastName} Liked ${forumModel.data![index].forumLikes!.length} Posts' ,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(forumModel.data![index].forumComments![index].createdAt.toString(), style: const TextStyle(color: lightgrey, fontSize: 12),)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Divider(height: 1, thickness: 1, indent: 10, endIndent: 10,),
                ],
              )
                  : forumModel.data![index].forumComments!.length > 9
                  ? Column(
                children: [
                  Row(
                    crossAxisAlignment : CrossAxisAlignment.start,
                    children: [

                      CircleAvatar(
                        backgroundImage: NetworkImage('https://lavie.orangedigitalcenteregypt.com${forumModel.data![index].imageUrl.toString()}'),
                        radius: 16.0,
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        children: [
                          Text('${forumModel.data![index].publisher!.firstName} ${forumModel.data![index].publisher!.lastName} Liked ${forumModel.data![index].forumLikes!.length} Posts' ,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 7,),
                          Container(
                              height: 28.0,
                              decoration: const BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                      width: 4.0,
                                      color: lightgrey,
                                    )
                                ),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/5),
                                  child: Text(forumModel.data![index].forumComments![index].comment.toString(), style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: lightBlack,
                                  ),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,))
                          ),
                          const SizedBox(height: 7,),
                          Text(forumModel.data![index].forumComments![index].createdAt.toString(), style: const TextStyle(color: lightgrey, fontSize: 12),)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Divider(height: 1, thickness: 1, indent: 10, endIndent: 10,),
                ],
              )
                  : Column(
                children: [
                  Row(
                    crossAxisAlignment : CrossAxisAlignment.start,
                    children: const [

                      CircleAvatar(
                        backgroundImage: NetworkImage('https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png'),
                        radius: 16.0,
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text('Joy Arnold left 6 comments on Your Post',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Text('Yesterday at 11:42 PM', style: TextStyle(color: lightgrey, fontSize: 12),),
                  const SizedBox(height: 10,),
                  const Divider(height: 1, thickness: 1, indent: 10, endIndent: 10,),
                ],
              )
          );

        });
  }
}
