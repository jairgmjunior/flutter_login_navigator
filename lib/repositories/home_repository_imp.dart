import 'package:dio/dio.dart';
import 'package:splash_screen_login/models/post_model.dart';
import 'package:splash_screen_login/repositories/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      var lista =
          (response.data as List).map((e) => PostModel.fromJson(e)).toList();

      lista.sort((p1, p2) {
        return Comparable.compare(p1.id, p2.id);
      });

      return lista;
    } catch (e) {
      print(e);
    }

    return [];
  }
}
