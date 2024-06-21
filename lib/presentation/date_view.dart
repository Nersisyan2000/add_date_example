import 'package:cubit_example/cubit/date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DateView extends StatefulWidget {
  const DateView({super.key});

  @override
  State<DateView> createState() => _DateViewState();
}

class _DateViewState extends State<DateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: BlocBuilder<DateCubit, List<String>>(
            builder: (context, dates) {
              return ListView.builder(
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      debugPrint(index.toString());
                      setState(() {
                        dates.removeAt(index);
                      });
                    },
                    background: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ), // Adjust the radius as needed
                      ),
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.all(4.0),
                      padding: const EdgeInsets.only(right: 20.0),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: Card(
                      elevation: 2.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text(dates[index]),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<DateCubit>().addDate(
              DateFormat('EEE, MMM d, yyyy ' 'h:mm a').format(
                DateTime.now(),
              ),
            ),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //
    );
  }
}
