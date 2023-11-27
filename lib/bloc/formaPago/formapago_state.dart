part of 'formapago_bloc.dart';

@immutable
abstract class FormapagoState {}

class FormapagoInitial extends FormapagoState {}

class FormapagoInitialState extends FormapagoState {}

class FormapagoLoadingState extends FormapagoState {}

class FormapagoLoadedState extends FormapagoState {
  List<FormaPagoModelo> FormapagoList;
  FormapagoLoadedState(this.FormapagoList);
}

class FormapagoError extends FormapagoState {
  Error e;
  FormapagoError(this.e);
}
