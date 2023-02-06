abstract class PostEvent {}

class OnChangeEvent extends PostEvent {
  final String value;
  OnChangeEvent(this.value);
}

class GetSearchStringEvent extends PostEvent {}
