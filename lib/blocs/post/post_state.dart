class PostState {
  String _searchValue = "";

  PostState._();
  static final PostState _instance = PostState._();
  factory PostState() => _instance;

  String get searchValue => _searchValue;

  void onChange(value) {
    _searchValue = value;
  }
}
