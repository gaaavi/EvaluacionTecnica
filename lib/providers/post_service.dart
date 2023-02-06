import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

/// Realiza una peticion al endpoint y retorna una instancia de la clase Post.
Future<Post> getPost(endpoint) async {
  final String baseUrl = "https://jsonplaceholder.typicode.com/$endpoint";

  final response = await http.get(Uri.parse(baseUrl));

  /// Retorna la instancia de la clase Post si no hay errores.
  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw "Error. No se pudo obtener la información solicitada.";
  }
}
