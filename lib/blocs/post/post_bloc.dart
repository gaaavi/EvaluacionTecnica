import 'dart:async';
import './post_event.dart';
import './post_state.dart';

class PostBloc {
  final PostState _postState = PostState();

  final StreamController<PostEvent> _input = StreamController();
  final StreamController<String> _output = StreamController();

  StreamSink<PostEvent> get sendEvent => _input.sink;
  Stream<String> get postStream => _output.stream;

  PostBloc() {
    _input.stream.listen(_onEvent);
  }

  void _onEvent(PostEvent event) {
    if (event is OnChangeEvent) _postState.onChange(event.value);
    _output.add(_postState.searchValue);
  }

  void dispose() {
    _input.close();
    _output.close();
  }
}
