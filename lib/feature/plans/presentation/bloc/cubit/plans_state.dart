part of 'plans_cubit.dart';

sealed class PlansState extends Equatable {
  const PlansState();

  @override
  List<Object> get props => [];
}

final class PlansInitial extends PlansState {}

final class PlansLoadingState extends PlansState {}

final class PlansLoadedState extends PlansState {}
