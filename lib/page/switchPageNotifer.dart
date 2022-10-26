import 'package:exploring_riverpod/switch_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwitchHomeNotifierPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context).size;
    final switchImplement = ref.watch(myswitchNotifierProvider);

    final singleswitch = ref.watch(singleswitchName);
    final hopeRiverpodText = ref.watch(hopeRiverpod);
    final appname = ref.watch(appNameRiverpod);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, appname) as PreferredSizeWidget?,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: mq.height * 0.01,
              horizontal: mq.width * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: mq.width * 0.036,
                          top: mq.height * 0.01,
                        ),
                        child: Text(
                          singleswitch,
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.headline5!.fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SwitchListTile(
                          title: Text(
                            'Single Switch',
                          ),
                          activeColor: Colors.redAccent,
                          value: switchImplement,
                          onChanged: (change) {
                            ref
                                .read(myswitchNotifierProvider.notifier)
                                .changeValue(change);
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.04,
                ),
                Text(
                  hopeRiverpodText,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar(BuildContext context, String appname) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        appname,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
