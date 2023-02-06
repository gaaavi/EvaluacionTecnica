import 'package:evaluacion_tecnica_niu/widgets/posts/posts_tile.dart';
import 'package:flutter/material.dart';

import '../../models/post_model.dart';

/// Retorna un FutureBuilder con los Posts.
class PostsBuilder extends StatelessWidget {
  const PostsBuilder({
    super.key,
    required this.getPosts,
    required this.searchString,
  });

  final Future<Post> getPosts;
  final String searchString; // Variable para almacenar el texto de busqueda

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPosts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (context, i) {
              /// Compara si el dato ingresado en la busqueda coincide con algun elmento.
              /// En caso de estar vacio, retorna todo el listado
              return (snapshot.data!.result[i]["body"].contains(searchString) ||
                      snapshot.data!.result[i]["title"].contains(searchString))
                  ? postTile(snapshot.data!.result[i], context)
                  : const SizedBox.shrink();
            },
            itemCount: snapshot.data!.result.length,
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
