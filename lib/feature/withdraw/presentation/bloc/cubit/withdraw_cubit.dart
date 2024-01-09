import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'withdraw_state.dart';

class WithdrawCubit extends Cubit<WithdrawState> {
  WithdrawCubit() : super(WithdrawInitial());
  String withdrawFilter = 'Withdraw';

  selectWithdrawfilter({required String filter}) {
    emit(WithdrawLoadingState());
    withdrawFilter = filter;
    emit(WithdrawLoadedState());
  }
}
