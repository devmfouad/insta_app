import '../global.dart';
import '../models/post_model.dart';

class PostsHelper {
 static Future<List<PostModel>> getPosts({required String userId}) async {
    print("getPosts");
    List<PostModel> posts = [];

    var result = await firebaseFirestore
        .collection(postsCollection)
        .where("userId", isEqualTo: userId)
        .get();
    print(result.docs.length);

    if (result.docs.isNotEmpty) {
      for (var doc in result.docs) {
        var data = doc.data();
        posts.add(PostModel(
          userId: data["userId"],
          body: data["body"],
          imageUrl: data["imageUrl"],
        ));
      }
    }

    return posts;
  }
}
