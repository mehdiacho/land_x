import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:land_x/counter/counter.dart';
import 'package:land_x/l10n/l10n.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text('Land Exploration')),),
      body: Center(
          child: Column(
            children: [
              Text('You are this far away from exploring the '
                  'WHOLE universe'),
              LinearProgressIndicator(value: 0.0,),
              Text(l10n.pendingTask),
              TaskItem(label: 'Load rocket with supplies'),
              Padding(
                padding: EdgeInsets.all(14.0),
                child: TextField(),
              ),
            ],
          )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
          ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.displayLarge);
  }
}

class TaskItem extends StatelessWidget {
  final String label;

  const TaskItem({Key? key, required this.label}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Checkbox(value: false, onChanged: null),
        Text(label),
      ],
    );
  }
}
class NewTask extends StatefulWidget {
  @override
  NewTaskState createState() => NewTaskState();
}
class NewTaskState extends State<NewTask> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return TextField(
        controller: controller,
        onChanged: (value) {

        },
      );
  }
}
