import 'package:evaluacion_tecnica_niu/models/post_model.dart';
import 'package:flutter/material.dart';

/// Retorna un FutureBuilder para la construccion del Grid de imagenes.
class PhotosBuilder extends StatelessWidget {
  const PhotosBuilder({
    super.key,
    required this.postPhotos,
  });

  final Future<Post> postPhotos;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postPhotos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, i) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          snapshot.data!.result[i]["url"],
                          height: 175,
                        ),
                      )
                    ],
                  );
                },
                itemCount: snapshot.data!.result.length),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
