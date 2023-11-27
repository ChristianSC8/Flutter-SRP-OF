part of 'estadopago_bloc.dart';

@immutable
abstract class EstadopagoState {}

class EstadopagoInitial extends EstadopagoState {}
class EstadopagoInitialState extends EstadopagoState{}
class EstadopagoLoadingState extends EstadopagoState{}
class EstadopagoLoadedState extends EstadopagoState{
  List<EstadopagoModelo> EstadopagoList;
  EstadopagoLoadedState(this.EstadopagoList);
}
class EstadopagoError extends EstadopagoState{
  Error e;
  EstadopagoError(this.e);
}