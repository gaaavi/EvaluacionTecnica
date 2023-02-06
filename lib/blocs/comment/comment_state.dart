class CommentState {
  String _searchValue = "";

  /// Constructor privado.
  CommentState._();

  /// Crear una instancia privada del constructor.
  static final CommentState _instance = CommentState._();

  /// Generar instancia.
  factory CommentState() => _instance;

  /// Metodo que obtiene el valor de busqueda.
  String get searchValue => _searchValue;

  /// Metodo que actualiza el valor de busqueda.
  void onChange(value) {
    _searchValue = value;
  }
}
