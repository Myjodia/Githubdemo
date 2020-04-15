import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {

  const UserEvent();
 
}

class Fetch extends UserEvent {
  final String url;

  const Fetch(this.url);

   @override
  List<Object> get props => [url];

}
