import '../auth/login_model.dart';

class MyForumModel {
  MyForumModel({
    required this.type,
    required this.message,
    required this.data,
  });
  late final String type;
  late final String message;
  late final List<MyForumData> data;

  MyForumModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>MyForumData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class MyForumData {
  MyForumData({
    required this.forumId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.userId,
    required this.ForumLikes,
    required this.ForumComments,
    required this.user,
  });
  late final String forumId;
  late final String title;
  late final String description;
  late final String imageUrl;
  late final String userId;
  late final List<dynamic> ForumLikes;
  late final List<dynamic> ForumComments;
  late final User user;

  MyForumData.fromJson(Map<String, dynamic> json){
    forumId = json['forumId']??'';
    title = json['title']??'';
    description = json['description']??'';
    imageUrl = json['imageUrl']??'';
    userId = json['userId']??'';
    ForumLikes = List.castFrom<dynamic, dynamic>(json['ForumLikes']??'');
    ForumComments = List.castFrom<dynamic, dynamic>(json['ForumComments']??'');
    user = User.fromJson(json['user']??'');
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['forumId'] = forumId;
    _data['title'] = title;
    _data['description'] = description;
    _data['imageUrl'] = imageUrl;
    _data['userId'] = userId;
    _data['ForumLikes'] = ForumLikes;
    _data['ForumComments'] = ForumComments;
    _data['user'] = user.toJson();
    return _data;
  }
}
