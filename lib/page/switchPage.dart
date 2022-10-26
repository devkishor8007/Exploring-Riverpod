import 'package:exploring_riverpod/switch_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final switchRiverpod =
    ChangeNotifierProvider<SwitchWidget>((ref) => SwitchWidget());

final multipleSwitchRiverpod = ChangeNotifierProvider<MultipleSwitchWidget>(
  (ref) => MultipleSwitchWidget(),
);

class SwitchHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context).size;
    var switchImplement = ref.watch(switchRiverpod);
    final multipleswitchImplement = ref.watch(multipleSwitchRiverpod);

    final singleswitch = ref.watch(singleswitchName);
    final multipleswitch = ref.watch(multipleswitchName);
    final hopeRiverpodText = ref.watch(hopeRiverpod);
    final appname = ref.watch(appNameRiverpod);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, appname) as PreferredSizeWidget?,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: mq.height * 0.01, horizontal: mq.width * 0.03),
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
                      singleSwitchListTile(switchImplement, context),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.04,
                ),
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
                          multipleswitch,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                Theme.of(context).textTheme.headline5!.fontSize,
                          ),
                        ),
                      ),
                      multipleSwitchListTile(
                        context,
                        textSwitch: 'First Switch',
                        value: multipleswitchImplement.value1,
                        onChanged: (vax) {
                          multipleswitchImplement.onChangedMultipleOne(vax);
                        },
                      ),
                      multipleSwitchListTile(
                        context,
                        textSwitch: 'Second Switch',
                        value: multipleswitchImplement.value2,
                        onChanged: (vax) {
                          multipleswitchImplement.onChangedMultipleTwo(vax);
                        },
                      ),
                      multipleSwitchListTile(
                        context,
                        textSwitch: 'Third Switch',
                        value: multipleswitchImplement.value3,
                        onChanged: (vax) {
                          multipleswitchImplement.onChangedMultipleThree(vax);
                        },
                      ),
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

  Widget singleSwitchListTile(
      SwitchWidget switchImplement, BuildContext context) {
    return SwitchListTile(
        title: Text(
          'Single Switch',
        ),
        activeColor: Colors.redAccent,
        value: switchImplement.value,
        onChanged: (change) {
          switchImplement.onChanged(change);
        });
  }

  Widget multipleSwitchListTile(BuildContext context,
      {required bool value,
      required void Function(bool)? onChanged,
      String? textSwitch}) {
    return SwitchListTile(
      title: Text(
        textSwitch!,
      ),
      activeColor: Colors.redAccent,
      value: value,
      onChanged: onChanged,
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
