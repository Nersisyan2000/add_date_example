import 'package:cubit_example/cubit/date_cubit.dart';
import 'package:cubit_example/presentation/date_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DatePage extends StatelessWidget {
  const DatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DateCubit(),
      child: const DateView(),
    );
  }
}
