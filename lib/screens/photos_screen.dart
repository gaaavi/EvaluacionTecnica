import 'package:evaluacion_tecnica_niu/models/post_model.dart';
import 'package:evaluacion_tecnica_niu/providers/post_service.dart';
import 'package:evaluacion_tecnica_niu/widgets/photos/photos.dart';
import 'package:flutter/material.dart';

/// Pantalla para mostrar el catalogo de fotos de cada post.
class PhotosScreen extends StatefulWidget {
  final int postId;
  const PhotosScreen({super.key, required this.postId});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  late Future<Post> postPhotos;

  @override
  void initState() {
    super.initState();
    postPhotos = getPost("posts/${widget.postId}/photos/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Album")),
      body: PhotosBuilder(postPhotos: postPhotos),
    );
  }
}
