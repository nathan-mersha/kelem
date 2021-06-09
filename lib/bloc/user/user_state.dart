part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserSignedInState extends UserState {
  @override
  List<Object> get props => [];
}

class UserSignedOutState extends UserState {
  @override
  List<Object> get props => [];
}

class UserSigningOutErrorState extends UserState {
  @override
  List<Object> get props => [];
}
