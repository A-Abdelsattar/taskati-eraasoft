part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}


final class GetTasksSuccessState extends HomeState {
  final List<Task> tasks;
  GetTasksSuccessState(this.tasks);
}

final class GetTasksLoadingState extends HomeState {}
final class GetTasksErrorState extends HomeState {}

