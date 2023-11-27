import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reserva_parapente/modelo/reservaModelo.dart';
import 'package:reserva_parapente/repository/ReservaRepository.dart';

part 'reserva_event.dart';
part 'reserva_state.dart';

class ReservaBloc extends Bloc<ReservaEvent, ReservaState> {
    late final ReservaRepository _reservaRepository;
  ReservaBloc(this._reservaRepository) : super(ReservaInitial()) {
    on<ReservaEvent>((event, emit) async {
      
        print("Bloc x");
      if(event is ListReservaEvent){
        emit(ReservaLoadingState());
        try{
          print("pasox!!");
          List<ReservaModelo> ReservaList  = await _reservaRepository.getReserva();
          emit(ReservaLoadedState(ReservaList ));
        } catch(e){
          emit(ReservaError(e as Error)) ;
        }
      }else if(event is DeleteReservaEvent){
        try{
          await _reservaRepository.deleteReserva(event.reserva!.id);
          emit(ReservaLoadingState());
          List<ReservaModelo> ReservaList = await _reservaRepository.getReserva();
          emit(ReservaLoadedState(ReservaList));
        }catch(e){
          emit(ReservaError(e as Error));
        }
      }else if(event is CreateReservaEvent){
        try{
          await _reservaRepository.createReserva(event.reserva!);
          emit(ReservaLoadingState());
          List<ReservaModelo> ReservaList= await _reservaRepository.getReserva();
          emit(ReservaLoadedState(ReservaList));
        }catch(e){
          emit(ReservaError(e as Error));
        }
      }else if(event is UpdateReservaEvent){
        try{
          await _reservaRepository.updateReserva(event.reserva!.id, event.reserva!);
          emit(ReservaLoadingState());
          List<ReservaModelo> ReservaList= await _reservaRepository.getReserva();
          emit(ReservaLoadedState(ReservaList));
        }catch(e){
          emit(ReservaError(e as Error));
        }
      }
    });
  }
}
