import 'package:exploring_riverpod/slider_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderRiverpod =
    ChangeNotifierProvider<SliderWidget>((ref) => SliderWidget());

class SliderNotifierPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context).size;
    var sliderImplement = ref.watch(sliderNotifierRiverpod);

    final whatWidgetImpl = ref.watch(whatWidgetRivepod);
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
                makeTextHelp(
                  context,
                  whatWidgetImpl,
                  size: Theme.of(context).textTheme.headline6!.fontSize,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: mq.width * 0.043,
                    top: mq.height * 0.03,
                  ),
                  child: makeTextHelp(
                    context,
                    "The value is " + sliderImplement.toString(),
                  ),
                ),
                Slider(
                  min: 0,
                  max: 10,
                  value: sliderImplement,
                  onChanged: (v) {
                    ref.read(sliderNotifierRiverpod.notifier).onchanged(v);
                  },
                ),
                SizedBox(
                  height: mq.height * 0.3,
                ),
                makeTextHelp(
                  context,
                  hopeRiverpodText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeTextHelp(BuildContext context, String text1, {double? size}) {
    return Text(
      text1,
      style: TextStyle(
        color: Colors.white,
        fontSize: size ?? Theme.of(context).textTheme.bodyText1!.fontSize,
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
