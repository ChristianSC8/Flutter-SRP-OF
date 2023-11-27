part of 'estadopago_bloc.dart';

@immutable
abstract class EstadopagoEvent {}

class ListEstadopagoEvent extends EstadopagoEvent{
  ListEstadopagoEvent(){print("Evento si");}
}
class DeleteEstadopagoEvent extends EstadopagoEvent{
  EstadopagoModelo estadopago;
  DeleteEstadopagoEvent(this.estadopago);
}
class UpdateEstadopagoEvent extends EstadopagoEvent{
  EstadopagoModelo estadopago;
  UpdateEstadopagoEvent(this.estadopago);
}
class CreateEstadopagoEvent extends EstadopagoEvent{
  EstadopagoModelo estadopago;
  CreateEstadopagoEvent(this.estadopago);
}