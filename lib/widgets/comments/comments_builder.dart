import 'package:flutter/material.dart';

import '../../models/post_model.dart';
import 'comments_tile.dart';

/// Retorna un FutureBuilder que contiene el commentTile para cada comentario.
class CommentsBuilder extends StatelessWidget {
  const CommentsBuilder({
    super.key,
    required this.getComments,
    required this.searchString,
  });

  final Future<Post> getComments;
  final String searchString; // Variable que almacena el string de busqueda

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getComments,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.result.length,
            itemBuilder: (context, i) {
              /// Compara si hay un elemento que coincida con la busqueda.
              /// Si la busqueda esta vacia retorna toda la lista.
              if (snapshot.data!.result[i]["body"].contains(searchString) ||
                  snapshot.data!.result[i]["email"].contains(searchString)) {
                return commentTile(snapshot.data!.result[i]);
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
