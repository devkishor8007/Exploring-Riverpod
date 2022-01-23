import 'package:exploring_riverpod/riverpod_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appCounterRiverpod = ChangeNotifierProvider<CounterRiverpod>(
  (ref) => CounterRiverpod(),
);

class CounterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context).size;
    var applyCount = ref.watch(appCounterRiverpod);
    final appName = ref.watch(appNameRiverpod);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(appName, context),
        floatingActionButton: rowfloatingActionButton(applyCount, mq),
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

  AppBar appBar(String appName, BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        '$appName',
        style:
            Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
      ),
    );
  }

  Widget rowfloatingActionButton(CounterRiverpod applyCount, Size mq) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            applyCount.add();
          },
          child: Icon(Icons.add),
        ),
        SizedBox(
          width: mq.width * 0.02,
        ),
        FloatingActionButton(
          onPressed: () {
            applyCount.subtract();
          },
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}
