part of 'onboarding_cubit.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingLoadingState extends OnboardingState {}

final class OnboardingMiningLoadingState extends OnboardingState {}

final class OnboardingMiningLoadedState extends OnboardingState {}

final class OnboardingLoadedState extends OnboardingState {}

final class OnboardingSigin extends OnboardingState {}

final class OnboardingSiginOut extends OnboardingState {}

final class OnboardingError extends OnboardingState {
  final String error;
  const OnboardingError({required this.error});
  @override
  List<Object> get props => [];
}
