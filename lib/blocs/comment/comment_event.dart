/// Clase abtracta/
abstract class CommentEvent {}

/// Evento que se ejecuta al momento de cambiar el valor de busqueda.
class OnChangeEvent extends CommentEvent {
  final String value;
  OnChangeEvent(this.value);
}

/// Evento con el que obtenemos el valor actual de busqueda.
class GetSearchStringEvent extends CommentEvent {}
