import 'package:flutter/material.dart';
import '../utils/styles/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:recycle/drawer.dart';
import 'package:recycle/Alfredo/widgets/customAppBar.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:recycle/Authentication/page/login_page.dart';
import '../utils/styles/app_layout.dart';
import '../model/event.dart';
import '../method/event_method.dart';
import "package:flutter/cupertino.dart";
import "../page/event_your.dart";
import "../page/event_ongoing.dart";
import "../page/event_upcoming.dart";
import "../page/event_past.dart";

class EventDashboard extends StatefulWidget {
  const EventDashboard({super.key});

  @override
  State<EventDashboard> createState() => _EventDashboardState();
}

// make greeting text function
String greetingText() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return "Good Morning";
  } else if (hour < 17) {
    return "Good Afternoon";
  } else {
    return "Good Evening";
  }
}

class _EventDashboardState extends State<EventDashboard> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const ExternalDrawer(),
        appBar: const CustomAppBar(),
        backgroundColor: Styles.bgColor,
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.blueGrey[100],
              child: InkWell(
                  child: Center(
                      child: Text(
                    "Event Anda",
                    style: Styles.h2,
                  )),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const YourEventPage()));
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.blueGrey[100],
              child: InkWell(
                  child: Center(
                      child: Text(
                    "Event Berlangsung",
                    style: Styles.h2,
                  )),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OngoingEventPage()));
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.blueGrey[100],
              child: InkWell(
                  child: Center(
                      child: Text(
                    "Event yang Akan Datang",
                    style: Styles.h2,
                  )),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UpcomingEvent()));
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.blueGrey[100],
              child: InkWell(
                  child: Center(
                      child: Text(
                    "Event yang Telah Selesai",
                    style: Styles.h2,
                  )),
                  onTap: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PastEvent()));
                  }),
            ),
          ],
        ));
  }
}
