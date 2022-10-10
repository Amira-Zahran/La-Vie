class PostModel {
  PostModel({
    required this.type,
    required this.message,
    required this.data,
  });
  late final String type;
  late final String message;
  late final PostData data;

  PostModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = PostData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class PostData {
  PostData({
    required this.forumId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.userId,
  });
  late final String forumId;
  late final String title;
  late final String description;
  late final String imageUrl;
  late final String userId;

  PostData.fromJson(Map<String, dynamic> json){
    forumId = json['forumId'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['forumId'] = forumId;
    _data['title'] = title;
    _data['description'] = description;
    _data['imageUrl'] = imageUrl;
    _data['userId'] = userId;
    return _data;
  }
}