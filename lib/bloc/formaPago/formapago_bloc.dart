import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reserva_parapente/modelo/formapagoModelo.dart';
import 'package:reserva_parapente/repository/formapagoRepository.dart';

part 'formapago_event.dart';
part 'formapago_state.dart';

class FormapagoBloc extends Bloc<FormapagoEvent, FormapagoState> {
  late final FormaPagoRepository _formapagoRepository;
  FormapagoBloc(this._formapagoRepository) : super(FormapagoInitial()) {
    on<FormapagoEvent>((event, emit) async {
      print("Bloc x");
      if (event is ListFormapagoEvent) {
        emit(FormapagoLoadingState());
        try {
          print("pasox!!");
          List<FormaPagoModelo> FormapagoList =
              await _formapagoRepository.getFormapago();
          emit(FormapagoLoadedState(FormapagoList));
        } catch (e) {
          emit(FormapagoError(e as Error));
        }
      } else if (event is DeleteFormapagoEvent) {
        try {
          await _formapagoRepository.deleteFormapago(event.formapago!.id);
          emit(FormapagoLoadingState());
          List<FormaPagoModelo> FormapagoList =
              await _formapagoRepository.getFormapago();
          emit(FormapagoLoadedState(FormapagoList));
        } catch (e) {
          emit(FormapagoError(e as Error));
        }
      } else if (event is CreateFormapagoEvent) {
        try {
          await _formapagoRepository.createFormapago(event.formapago!);
          emit(FormapagoLoadingState());
          List<FormaPagoModelo> FormapagoList =
              await _formapagoRepository.getFormapago();
          emit(FormapagoLoadedState(FormapagoList));
        } catch (e) {
          emit(FormapagoError(e as Error));
        }
      } else if (event is UpdateFormapagoEvent) {
        try {
          await _formapagoRepository.updateFormapago(
              event.formapago!.id, event.formapago!);
          emit(FormapagoLoadingState());
          List<FormaPagoModelo> FormapagoList =
              await _formapagoRepository.getFormapago();
          emit(FormapagoLoadedState(FormapagoList));
        } catch (e) {
          emit(FormapagoError(e as Error));
        }
      }
    });
  }
}
