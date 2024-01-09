part of 'withdraw_cubit.dart';

sealed class WithdrawState extends Equatable {
  const WithdrawState();

  @override
  List<Object> get props => [];
}

final class WithdrawInitial extends WithdrawState {}

final class WithdrawLoadingState extends WithdrawState {}

final class WithdrawLoadedState extends WithdrawState {}
