import 'package:flutter/material.dart';
import 'package:splash_screen_login/controllers/home_controller.dart';
import 'package:splash_screen_login/models/post_model.dart';
import 'package:splash_screen_login/repositories/home_repository.mock.dart';
import 'package:splash_screen_login/repositories/home_repository_imp.dart';
import 'package:splash_screen_login/services/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                PrefsService.logout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (_) => true);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
          valueListenable: _controller.posts,
          builder: (_, list, __) {
            return ListView.separated(
              itemCount: list.length,
              itemBuilder: (_, indx) => ListTile(
                leading: Text(list[indx].id.toString()),
                title: Text(list[indx].title),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () => Navigator.of(context)
                    .pushNamed('/details', arguments: list[indx]),
              ),
              separatorBuilder: (_, __) => const Divider(),
            );
          }),
    );
  }
}
