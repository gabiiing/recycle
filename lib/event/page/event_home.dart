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


class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
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

class _EventPageState extends State<EventPage> {
  late EventMethod data;
  late Future<List<Event>> _myEvents;
  late Future<List<Event>> _ongoingEvents;
  late Future<List<Event>> _upcomingEvents;
  late Future<List<Event>> _pastEvents;

  @override
  void initState() {
    super.initState();
    setState(() {
      data = EventMethod();
      _myEvents = data.getMyEvents(userData!['idUser']);
      _ongoingEvents = data.getOngoingEvents();
      _upcomingEvents = data.getUpcomingEvents();
      _pastEvents = data.getPastEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      drawer: const ExternalDrawer(),
      appBar: const CustomAppBar(),
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(greetingText(), style: Styles.h3),
                        const Gap(5),
                        Text("Hello " + userData!['username'],
                            style: Styles.h1),
                      ],
                    ),
                    // add profile icon
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        // add padding
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(40),
              // make future builder for _myEvents

                // event anda
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Event Anda", style: Styles.h2),
                    InkWell(
                        onTap: () {
                          print("See All");
                        },
                        child: Text("Lihat",
                            style: Styles.textStyle
                                .copyWith(color: Styles.primaryColor))),
                  ],
                ),
                

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Event Berlangsung", style: Styles.h2),
                    InkWell(
                        onTap: () {
                          print("See All");
                        },
                        child: Text("Lihat",
                            style: Styles.textStyle
                                .copyWith(color: Styles.primaryColor))),

                    // make carousel with listview

                    // batas suciii ----------------------------------------
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Event Mendatang", style: Styles.h2),
                    InkWell(
                        onTap: () {
                          print("See All");
                        },
                        child: Text("Lihat",
                            style: Styles.textStyle
                                .copyWith(color: Styles.primaryColor))),

                    // make carousel with listview

                    // batas suciii ----------------------------------------
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Event Telah Berakhir", style: Styles.h2),
                    InkWell(
                        onTap: () {
                          print("See All");
                        },
                        child: Text("Lihat",
                            style: Styles.textStyle
                                .copyWith(color: Styles.primaryColor))),

                    // make carousel with listview

                    // batas suciii ----------------------------------------
                  ],
                ),
              ],
            ),
          ),
          // const Gap(25),
        ],
      ),
    );
  }
}
