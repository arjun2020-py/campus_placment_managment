import 'package:bloc/bloc.dart';
import 'package:crms/homeScreen/repositry/student_count.dart';
import 'package:meta/meta.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<HomeScreenEvent>((event, emit) async {
      try {
        if (event is DashboadEvent) {
          final counts = await StudentCount().CountStatus(true);
          final applied = await StudentCount().AppliedJobs(false);
          emit(dashboadSusessState(totalJobs: counts, appliedJobs: applied));
        } else {
          emit(dashboadFailedState());
        }
      } catch (e) {
        print('--------$e');
      }
    });
  }
}
