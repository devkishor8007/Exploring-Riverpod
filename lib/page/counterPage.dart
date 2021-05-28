import 'package:exploring_riverpod/riverpod_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appCounterRiverpod = ChangeNotifierProvider<CounterRiverpod>(
  (ref) => CounterRiverpod(),
);

class CounterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final mq = MediaQuery.of(context).size;
    var applyCount = watch(appCounterRiverpod);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context),
        floatingActionButton: floatingActionButtons(context, mq),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Value :  " + applyCount.value.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline6
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
                  .caption
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget floatingActionButtons(BuildContext context, Size mq) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            context.read(appCounterRiverpod).add();
          },
          child: Icon(Icons.add),
        ),
        SizedBox(
          width: mq.width * 0.02,
        ),
        FloatingActionButton(
          onPressed: () {
            context.read(appCounterRiverpod).subtract();
          },
          child: Icon(Icons.remove),
        ),
      ],
    );
  }

  Widget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        context.read(appNameRiverpod),
        style:
            Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
      ),
    );
  }
}
