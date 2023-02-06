import 'package:evaluacion_tecnica_niu/providers/post_service.dart';
import 'package:evaluacion_tecnica_niu/widgets/comments/comments.dart';
import 'package:flutter/material.dart';

import '../blocs/comment/comment_bloc.dart';
import 'package:evaluacion_tecnica_niu/blocs/comment/comment_event.dart';
import '../models/post_model.dart';

class CommentsScreen extends StatefulWidget {
  final int postId;
  const CommentsScreen({super.key, required this.postId});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late Future<Post> getComments;
  String searchString = ""; // Variable que almacena el string de busqueda.

  final _commentBloc = CommentBloc(); // llamar el Bloc para la pantalla

  @override
  void initState() {
    super.initState();
    getComments = getPost("posts/${widget.postId}/comments/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 125,
          title: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Text(
                        "Comments",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              searchBar(),
            ],
          ),
        ),

        /// Stream builder para modificar el estado a partir del Bloc
        body: StreamBuilder(
          stream: _commentBloc.commentStream,
          initialData: "",
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            /// Retorna el builder del comentario.
            return CommentsBuilder(
                getComments: getComments, searchString: "${snapshot.data}");
          },
        ));
  }

  /// Widget que retorna la barra de busqueda.
  Widget searchBar() {
    return TextField(
      // En cada cambio que presenta el TextField, se ejecuta un evento que recible el Bloc.
      onChanged: (value) => _commentBloc.sendEvent.add(OnChangeEvent(value)),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(177, 192, 200, 1),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: "Buscar Comentarios",
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
      ),
    );
  }
}
