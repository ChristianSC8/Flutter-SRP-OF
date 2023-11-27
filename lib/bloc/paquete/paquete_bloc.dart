import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reserva_parapente/modelo/paqueteModelo.dart';
import 'package:reserva_parapente/repository/PaqueteRepository.dart';

part 'paquete_event.dart';
part 'paquete_state.dart'; 

class PaqueteBloc extends Bloc<PaqueteEvent, PaqueteState> {
  late final PaqueteRepository _paqueteRepository;
  PaqueteBloc(this._paqueteRepository) : super(PaqueteInitial()) {
    on<PaqueteEvent>((event, emit)  async{
      
       print("Bloc x");
      if(event is ListPaqueteEvent){
        emit(PaqueteLoadingState());
        try{
          print("pasox!!");
          List<PaqueteModelo> PaqueteList  = await _paqueteRepository.getPackages();
          emit(PaqueteLoadedState(PaqueteList ));
        } catch(e){
          emit(PaqueteError(e as Error)) ;
        }
      }else if(event is DeletePaqueteEvent){
        try{
          await _paqueteRepository.deletePackage(event.paquete!.id);
          emit(PaqueteLoadingState());
          List<PaqueteModelo> PaqueteList = await _paqueteRepository.getPackages();
          emit(PaqueteLoadedState(PaqueteList));
        }catch(e){
          emit(PaqueteError(e as Error));
        }
      }else if(event is CreatePaqueteEvent){
        try{
          await _paqueteRepository.createPackage(event.paquete!);
          emit(PaqueteLoadingState());
          List<PaqueteModelo> PaqueteList= await _paqueteRepository.getPackages();
          emit(PaqueteLoadedState(PaqueteList));
        }catch(e){
          emit(PaqueteError(e as Error));
        }
      }else if(event is UpdatePaqueteEvent){
        try{
          await _paqueteRepository.updatePackage(event.paquete!.id, event.paquete!);
          emit(PaqueteLoadingState());
          List<PaqueteModelo> PaqueteList= await _paqueteRepository.getPackages();
          emit(PaqueteLoadedState(PaqueteList));
        }catch(e){
          emit(PaqueteError(e as Error));
        }
      }

    }); 
  }
}
