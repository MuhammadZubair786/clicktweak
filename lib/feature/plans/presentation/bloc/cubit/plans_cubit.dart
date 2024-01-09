import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'plans_state.dart';

class PlansCubit extends Cubit<PlansState> {
  PlansCubit() : super(PlansInitial());

  String planFilter = 'PLANS';

  selectPlansFilter({required String plan}) {
    emit(PlansLoadingState());
    planFilter = plan;
    emit(PlansLoadedState());
  }
}
