import 'package:flutter_bloc/flutter_bloc.dart';

class DateCubit extends Cubit<List<String>> {
  DateCubit() : super([]);

  void addDate(String date) {
    emit([...state, date]);
  }
}
