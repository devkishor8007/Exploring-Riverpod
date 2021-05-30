import 'package:exploring_riverpod/basic_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataTypePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final mq = MediaQuery.of(context).size;

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "String Text " +
                          context.read(
                            stringRiverpod,
                          ),
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      "Integer Value : " + context.read(intRiverpod).toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      "Double Value : " +
                          context.read(doubleRiverpod).toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: mq.height * 0.03,
                    ),
                    Text(
                      "Riverpod List Data",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: mq.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(7)),
                      height: mq.height * 0.54,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: context.read(listRiverpod).length,
                        itemBuilder: (_, index) {
                          List data = context.read(listRiverpod);
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
                                  .headline6
                                  .copyWith(color: Colors.black),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: mq.height * 0.04,
                ),
                Text(
                  "Hope You'll Understand This! \nKeep Learning and Stay Safe",
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
