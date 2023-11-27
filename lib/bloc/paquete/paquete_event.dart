part of 'paquete_bloc.dart';

@immutable
abstract class PaqueteEvent {}

class ListPaqueteEvent extends PaqueteEvent{
  ListPaqueteEvent(){print("Evento si");}
}
class DeletePaqueteEvent extends PaqueteEvent{
  PaqueteModelo  paquete;
  DeletePaqueteEvent(this. paquete);
}
class UpdatePaqueteEvent extends PaqueteEvent{
  PaqueteModelo paquete;
  UpdatePaqueteEvent(this.paquete);
}
class CreatePaqueteEvent extends PaqueteEvent{
  PaqueteModelo paquete;
  CreatePaqueteEvent(this.paquete);
}