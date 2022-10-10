import 'package:flutter/material.dart';
import 'package:lavie_web/view/components/styles/colors.dart';


import '../../../../model/forums/forums_model.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*BlocProvider(
      create: (BuildContext context) { return ForumsCubit(); },
      child: BlocConsumer<ForumsCubit, CubitStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          ForumsCubit forums = ForumsCubit.get(context);
          return*/ Scaffold(
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
            body:/* forums.forumData!.forumComments == null || forums.forumData!.forumLikes == null
                ? CircularProgressIndicator()
                :*/ ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context , index) => index %2 == 0
                  ? notificationItemWithoutComment(/*Publisher(), ForumLikes(), index*/)
                  : notificationItemWithComment(/*ForumComments(), Publisher(), index*/),
              separatorBuilder: (context , index) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Container(
                  height: 1.0,
                  width: double.infinity,
                  color: lightBlack,
                ),
              ),
              itemCount: 10,
            ),
          );
        /*},
      ),
    );*/
  }

  Widget notificationItemWithoutComment (/*Publisher publisher, ForumLikes likes, index*/){
   // ForumsCubit myNotification = ForumsCubit.get(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 40,
        child: Row(
          crossAxisAlignment : CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png'),
              radius: 16.0,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Text('ahmed comment on your post',//publisher.firstName.toString() + publisher.lastName.toString() + /*comments.comment! == 1 ?*/ 'liked' /*: 'left ${comments.length}'*/ + /*likes.userId! == myNotification.myForumModel!.data[index].userId ? 'Your Post' :*/ 'Post' ,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget notificationItemWithComment (/*ForumComments comments, Publisher publisher, index*/){
    //
    // ForumsCubit myNotification = ForumsCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 134,
        child: Row(
          crossAxisAlignment : CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png'),
              radius: 16.0,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text( 'HMED;lkdsddsddddddd',//publisher.firstName.toString() + publisher.lastName.toString() + /*comments.comment! == 1 ?*/ 'commented on' /*: 'left ${comments.length}'*/ + /*comments.userId! == myNotification.myForumModel!.data[index].userId ? 'Your Post' : */'Post' ,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    height: 70.0,
                    decoration: const BoxDecoration(
                      border: Border(
                          left: BorderSide(
                            width: 4.0,
                            color: lightBlack,
                          )
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text('comments.comment!dsl,kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'comments.createdAt.toString()',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}