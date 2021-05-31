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
  Widget build(BuildContext context, ScopedReader watch) {
    final mq = MediaQuery.of(context).size;
    var switchImplement = watch(switchRiverpod);
    final multipleswitchImplement = watch(multipleSwitchRiverpod);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context),
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
                          context.read(singleswitchName),
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.headline5.fontSize,
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
                          context.read(multipleswitchName),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                Theme.of(context).textTheme.headline5.fontSize,
                          ),
                        ),
                      ),
                      multipleSwitchListTile(
                        context,
                        textSwitch: 'First Switch',
                        value: multipleswitchImplement.value1,
                        onChanged: (vax) {
                          context
                              .read(multipleSwitchRiverpod)
                              .onChangedMultipleOne(vax);
                        },
                      ),
                      multipleSwitchListTile(
                        context,
                        textSwitch: 'Second Switch',
                        value: multipleswitchImplement.value2,
                        onChanged: (vax) {
                          context
                              .read(multipleSwitchRiverpod)
                              .onChangedMultipleTwo(vax);
                        },
                      ),
                      multipleSwitchListTile(
                        context,
                        textSwitch: 'Third Switch',
                        value: multipleswitchImplement.value3,
                        onChanged: (vax) {
                          context
                              .read(multipleSwitchRiverpod)
                              .onChangedMultipleThree(vax);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.04,
                ),
                Text(
                  context.read(hopeRiverpod),
                  style: Theme.of(context)
                      .textTheme
                      .caption
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
          context.read(switchRiverpod).onChanged(change);
        });
  }

  Widget multipleSwitchListTile(BuildContext context,
      {bool value, Function onChanged, String textSwitch}) {
    return SwitchListTile(
      title: Text(
        textSwitch,
      ),
      activeColor: Colors.redAccent,
      value: value,
      onChanged: onChanged,
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
