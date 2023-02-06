import 'package:evaluacion_tecnica_niu/screens/comments_screen.dart';
import 'package:evaluacion_tecnica_niu/screens/photos_screen.dart';
import 'package:flutter/material.dart';

/// Retorna el diseño del Post.
Widget postTile(post, context) {
  return Container(
    margin: const EdgeInsets.only(bottom: 50),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.withOpacity(0.5)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 1,
          blurRadius: 1,
          offset: const Offset(0, 3),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post["title"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          post["body"],
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => PhotosScreen(postId: post["id"])),
              ),
              icon: const Icon(Icons.photo_size_select_actual_outlined),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CommentsScreen(postId: post["id"])),
              ),
              icon: const Icon(Icons.comment_outlined),
            ),
          ],
        )
      ],
    ),
  );
}
