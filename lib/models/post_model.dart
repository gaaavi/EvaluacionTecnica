class Post {
  /// Valor de salida
  final List<dynamic> result;

  /// Constructor
  const Post({required this.result});

  /// Creacion de instancia
  factory Post.fromJson(List<dynamic> parsedJson) {
    return Post(result: parsedJson);
  }
}
