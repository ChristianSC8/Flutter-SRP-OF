part of 'paquete_bloc.dart';

@immutable
abstract class PaqueteState {}

class PaqueteInitial extends PaqueteState {}
class PaqueteInitialState extends PaqueteState{}
class PaqueteLoadingState extends PaqueteState{}
class PaqueteLoadedState extends PaqueteState{
  List<PaqueteModelo> PaqueteList;
  PaqueteLoadedState(this.PaqueteList);
}
class PaqueteError extends PaqueteState{
  Error e;
  PaqueteError(this.e);
}