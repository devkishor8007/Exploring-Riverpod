import 'package:exploring_riverpod/riverpod_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotiferPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context).size;
    var counter = ref.watch(counterNotifierProvider);
    final appName = ref.watch(appNameRiverpod);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(appName, context),
        floatingActionButton: rowfloatingActionButton(ref, mq),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Value :  " + counter.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              height: mq.height * 0.02,
            ),
            Text(
              "Hope You'll like this! \nKeep Learning and Stay Safe",
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowfloatingActionButton(WidgetRef ref, Size mq) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            ref.read(counterNotifierProvider.notifier).add();
          },
          child: Icon(Icons.add),
        ),
        SizedBox(
          width: mq.width * 0.02,
        ),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterNotifierProvider.notifier).subtract();
          },
          child: Icon(Icons.remove),
        ),
      ],
    );
  }

  AppBar appBar(String appName, BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        '$appName',
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
