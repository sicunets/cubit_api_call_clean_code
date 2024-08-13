import 'package:cubit_api_call_clean_code/repository/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState>{

  final ApiRepository apiRepository;

  ApiCubit(this.apiRepository) : super(ApiInitial());

  Future<void> fetchData() async {
    try{
      emit(ApiLoading());
      final data = await apiRepository.fetchData();
      emit(ApiSuccess(data));
    } catch(e, t){
      emit(ApiFailure(e.toString()));
      // emit(ApiFailure(t.toString()));
    }
  }

}