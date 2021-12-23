import 'package:bloc/bloc.dart';

class MyCubitCubit extends Cubit<int> {
  MyCubitCubit() : super(0);

  @override
  void increment() => emit(state+1);

}