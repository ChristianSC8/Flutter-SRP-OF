import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reserva_parapente/modelo/estadopagoModelo.dart';

import 'package:reserva_parapente/repository/EstadopagoRepositoty.dart';

part 'estadopago_event.dart'; 
part 'estadopago_state.dart';

class EstadopagoBloc extends Bloc<EstadopagoEvent, EstadopagoState> {
  late final EstadoPagoRepository _estadopagoRepository;
  EstadopagoBloc(this._estadopagoRepository) : super(EstadopagoInitial()) {
    on<EstadopagoEvent>((event, emit)async {
      

       print("Bloc x");
      if(event is ListEstadopagoEvent){
        emit(EstadopagoLoadingState());
        try{
          print("pasox!!");
          List<EstadopagoModelo> EstadopagoList  = await _estadopagoRepository.getStates();
          emit(EstadopagoLoadedState(EstadopagoList ));
        } catch(e){
          emit(EstadopagoError(e as Error)) ;
        }
      }else if(event is DeleteEstadopagoEvent){
        try{
          await _estadopagoRepository.deleteStates(event.estadopago!.id);
          emit(EstadopagoLoadingState());
          List<EstadopagoModelo> EstadopagoList = await _estadopagoRepository.getStates();
          emit(EstadopagoLoadedState(EstadopagoList));
        }catch(e){
          emit(EstadopagoError(e as Error));
        }
      }else if(event is CreateEstadopagoEvent){
        try{
          await _estadopagoRepository.createStates(event.estadopago!);
          emit(EstadopagoLoadingState());
          List<EstadopagoModelo> EstadopagoList= await _estadopagoRepository.getStates();
          emit(EstadopagoLoadedState(EstadopagoList));
        }catch(e){
          emit(EstadopagoError(e as Error));
        }
      }else if(event is UpdateEstadopagoEvent){
        try{
          await _estadopagoRepository.updateStates(event.estadopago!.id, event.estadopago!);
          emit(EstadopagoLoadingState());
          List<EstadopagoModelo> EstadopagoList= await _estadopagoRepository.getStates();
          emit(EstadopagoLoadedState(EstadopagoList));
        }catch(e){
          emit(EstadopagoError(e as Error));
        }
      }
      
    });
  }
}
