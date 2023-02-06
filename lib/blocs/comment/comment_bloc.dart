import 'dart:async';
import './comment_event.dart';
import './comment_state.dart';

class CommentBloc {
  /// Variable privada
  final CommentState _postState = CommentState();

  /// Variables privadas de tipo StreamController
  final StreamController<CommentEvent> _input = StreamController();
  final StreamController<String> _output = StreamController();

  /// Exposicion de de Sink y Stream.s
  StreamSink<CommentEvent> get sendEvent => _input.sink;
  Stream<String> get commentStream => _output.stream;

  /// Constructor (escucha los eventos)
  CommentBloc() {
    _input.stream.listen(_onEvent);
  }

  /// Retorna el nuevo valor del estado.
  void _onEvent(CommentEvent event) {
    /// Validamos si el evento es OnChangeEvent.
    if (event is OnChangeEvent) _postState.onChange(event.value);

    /// Retornamos el nuevo valor.
    _output.add(_postState.searchValue);
  }

  /// Libera recursos cuando ya no se necesitan.
  void dispose() {
    _input.close();
    _output.close();
  }
}
