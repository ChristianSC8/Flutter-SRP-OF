part of 'formapago_bloc.dart';

@immutable
abstract class FormapagoEvent {}

class ListFormapagoEvent extends FormapagoEvent {
  ListFormapagoEvent() {
    print("Evento si");
  }
}

class DeleteFormapagoEvent extends FormapagoEvent {
  FormaPagoModelo formapago;
  DeleteFormapagoEvent(this.formapago);
}

class UpdateFormapagoEvent extends FormapagoEvent {
  FormaPagoModelo formapago;
  UpdateFormapagoEvent(this.formapago);
}

class CreateFormapagoEvent extends FormapagoEvent {
  FormaPagoModelo formapago;
  CreateFormapagoEvent(this.formapago);
}
