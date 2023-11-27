part of 'reserva_bloc.dart';

@immutable
abstract class ReservaEvent {}

class ListReservaEvent extends ReservaEvent{
  ListReservaEvent(){print("Evento si");}
}
class DeleteReservaEvent extends ReservaEvent{
  ReservaModelo  reserva;
  DeleteReservaEvent(this. reserva);
}
class UpdateReservaEvent extends ReservaEvent{
  ReservaModelo reserva;
  UpdateReservaEvent(this.reserva);
}
class CreateReservaEvent extends ReservaEvent{
  ReservaModelo reserva;
  CreateReservaEvent(this.reserva);
}