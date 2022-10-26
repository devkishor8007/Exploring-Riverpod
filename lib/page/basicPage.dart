import 'package:exploring_riverpod/basic_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataTypePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context).size;
    final appName = ref.watch(appNameRiverpod);
    final stringImpl = ref.watch(stringRiverpod);
    final intImpl = ref.watch(intRiverpod);
    final doubleImpl = ref.watch(doubleRiverpod);
    final dateImpl = ref.watch(dateRiverpod);
    final listImpl = ref.watch(listRiverpod);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(appName, context) as PreferredSizeWidget?,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: mq.height * 0.01, horizontal: mq.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "String Text " + stringImpl,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      "Integer Value : " + intImpl.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      "Date : " + dateImpl.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      "Double Value : " + doubleImpl.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: mq.height * 0.03,
                    ),
                    Text(
                      "Riverpod List Data",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: mq.height * 0.01,
                    ),
                    listViewSampleData(mq, listImpl, context),
                  ],
                ),
                SizedBox(
                  height: mq.height * 0.04,
                ),
                Text(
                  "Hope You'll Understand This! \nKeep Learning and Stay Safe",
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

  Widget listViewSampleData(
      Size mq, List<String> listImpl, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(7)),
      height: mq.height * 0.7,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: listImpl.length,
        itemBuilder: (_, index) {
          List data = listImpl;
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Icon(
                Icons.merge_type_outlined,
              ),
            ),
            title: Text(
              data[index],
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
          );
        },
      ),
    );
  }

  Widget appBar(String appname, BuildContext context) {
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
