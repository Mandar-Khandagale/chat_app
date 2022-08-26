import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class DateLabel extends StatefulWidget {
  const DateLabel({Key? key, required this.dateTime}) : super(key: key);

  final DateTime dateTime;

  @override
  State<DateLabel> createState() => _DateLabelState();
}

class _DateLabelState extends State<DateLabel> {

  late String dayInfo;

  @override
  void initState() {
    final createdAt = Jiffy(widget.dateTime);
    final now = DateTime.now();

    if(Jiffy(createdAt).isSame(now, Units.DAY)) {
      dayInfo = "Today";
    }else if(Jiffy(createdAt).isSame(now.subtract(const Duration(days: 1)), Units.DAY)) {
      dayInfo = "Yesterday";
    }else if(Jiffy(createdAt).isAfter(now.subtract(const Duration(days: 7)), Units.DAY)) {
      dayInfo = createdAt.EEEE;
    }else if(Jiffy(createdAt).isAfter(Jiffy(now).subtract(years: 1), Units.DAY)) {
      dayInfo = createdAt.MMMd;
    }else {
      dayInfo = createdAt.MMMd;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          color: Theme.of(context).cardColor,
        ),
        child:  Text( dayInfo,
          style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}