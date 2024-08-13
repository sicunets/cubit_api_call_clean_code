part of 'api_cubit.dart';

abstract class ApiState{}

class ApiInitial extends ApiState{}

class ApiLoading extends ApiState{}

class ApiSuccess extends ApiState{
  final List<dynamic> data;
  ApiSuccess(this.data);
}

class ApiFailure extends ApiState{
  final String error;
  ApiFailure(this.error);
}