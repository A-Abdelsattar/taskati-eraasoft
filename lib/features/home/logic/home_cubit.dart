import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskati_app/features/home/data/models/task_model.dart';
import 'package:taskati_app/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getAllTasks(){
    emit(GetTasksLoadingState());
    HomeRepo.getAllTasks().then((value){
      emit(GetTasksSuccessState(value?.data??[]));
    }).catchError((error){
      emit(GetTasksErrorState());
    });
  }
}
