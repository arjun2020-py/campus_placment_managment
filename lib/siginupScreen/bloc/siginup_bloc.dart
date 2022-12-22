import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'siginup_event.dart';
part 'siginup_state.dart';

class SiginupBloc extends Bloc<SiginupEvent, SiginupState> {
  SiginupBloc() : super(SiginupInitial()) {
    on<SiginupEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
