part of 'reserva_bloc.dart';

@immutable
abstract class ReservaState {}

class ReservaInitial extends ReservaState {}
class ReservaInitialState extends ReservaState{}
class ReservaLoadingState extends ReservaState{}
class ReservaLoadedState extends ReservaState{
  List<ReservaModelo> ReservaList;
  ReservaLoadedState(this.ReservaList);
}
class ReservaError extends ReservaState{
  Error e;
  ReservaError(this.e);
} 