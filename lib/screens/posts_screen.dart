import 'package:evaluacion_tecnica_niu/blocs/post/post_bloc.dart';
import 'package:evaluacion_tecnica_niu/blocs/post/post_event.dart';
import 'package:evaluacion_tecnica_niu/providers/post_service.dart';
import 'package:evaluacion_tecnica_niu/widgets/posts/posts.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';

/// Pantalla para mostrar los Post.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Post> getPosts;
  String searchString = ""; // Variable que almacene el string de busqueda

  final _postBloc = PostBloc(); // Llamado al Bloc de Posts

  @override
  void initState() {
    super.initState();
    getPosts = getPost("posts");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 105,
        title: Column(
          children: [
            const Text("Post"),
            const SizedBox(
              height: 10,
            ),
            searchBar(),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        // StreamBuilder para mostrar los cambios segun el Bloc.
        child: StreamBuilder(
          stream: _postBloc.postStream,
          initialData: "",
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return PostsBuilder(
                getPosts: getPosts, searchString: "${snapshot.data}");
          },
        ),
        // child: PostsBuilder(getPosts: getPosts, searchString: searchString),
      ),
    );
  }

  Widget searchBar() {
    return TextField(
      onChanged: (value) => _postBloc.sendEvent.add(OnChangeEvent(
          value)), // Por cada cambio en el TextField, envia un evento al Bloc.x
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(177, 192, 200, 1),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        hintText: "Buscar Post",
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
      ),
    );
  }
}
