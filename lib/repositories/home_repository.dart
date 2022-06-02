import 'package:splash_screen_login/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}
