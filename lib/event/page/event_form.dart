import 'package:flutter/material.dart';
import '../model/event.dart';
import '../method/event_method.dart';
import '../page/event_your.dart';
import 'package:recycle/Authentication/page/login_page.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:recycle/drawer.dart';
import 'package:recycle/Alfredo/widgets/customAppBar.dart';
import 'package:recycle/event/page/event_dashboard.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final _EventFormKey = GlobalKey<FormState>();

  String user = userData!['idUser'].toString();
  String title = "";
  String brief = "";
  String description = "";
  DateTime created_date = DateTime.now();
  DateTime started_date = DateTime.now();
  DateTime finished_date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const ExternalDrawer(),
      body: Form(
        key: _EventFormKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // make text "Create event" in the center
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Create Event",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: "Title",
                      hintText: "Enter Title",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter title";
                      }
                      title = value;
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: "Brief",
                      hintText: "Enter Brief",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter brief";
                      }
                      brief = value;
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: "Description",
                      hintText: "Enter Description",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Description";
                      }
                      description = value;
                      return null;
                    },
                  ),
                ),
                // make datetime picker
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () {
                          DatePicker.showDateTimePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2021, 12, 5),
                              maxTime: DateTime(2100, 12, 12),
                              onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                            started_date = date;
                            print(started_date);
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.id);
                        },
                        child: Text(
                          'set start date',
                          style: TextStyle(color: Colors.green),
                        ))),

                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () {
                          DatePicker.showDateTimePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2021, 12, 5),
                              maxTime: DateTime(2100, 12, 12),
                              onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                            finished_date = date;
                            print(finished_date);
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.id);
                        },
                        child: Text(
                          'set finish date',
                          style: TextStyle(color: Colors.green),
                        ))),

                ElevatedButton(
                    child: Text(
                      "Create Event",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      _EventFormKey.currentState!.validate();
                      if (_EventFormKey.currentState!.validate() ?? false) {
                        print(started_date.runtimeType);
                        print(finished_date.runtimeType);
                        String date = started_date.toString().split(" ")[0];
                        String time = started_date
                            .toString()
                            .split(" ")[1]
                            .substring(0, 8);
                        print(date);
                        print(time);
                        String sdate = date + "T" + time;
                        date = finished_date.toString().split(" ")[0];
                        time = finished_date
                            .toString()
                            .split(" ")[1]
                            .substring(0, 8);
                        String fdate = date + "T" + time;

                        print(started_date.toString());

                        await request.post(
                            "https://pbp-d01.up.railway.app/event/add-event/", {
                          // "http://127.0.0.1:8000/event/add-event/",
                          // {
                          "title": title,
                          "brief": brief,
                          "description": description,
                          "start_date": sdate,
                          "finish_date": fdate,
                        }).then(
                          (value) {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 15,
                                    child: ListView(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                      ),
                                      shrinkWrap: true,
                                      children: [
                                        const Center(
                                          child: Text(
                                            'Berhasil menambahkan event baru!',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        TextButton(
                                          child: const Text(
                                            'Close',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          onError: (error) {
                            print(error);
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 15,
                                    child: ListView(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                      ),
                                      shrinkWrap: true,
                                      children: [
                                        const Center(
                                          child: Text(
                                            "Tidak dapat menambahkan event karena suatu hal!",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        TextButton(
                                          child: const Text(
                                            "Close",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                        );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => YourEventPage()));
        },
        
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

//show datetime picker
// Future pickDateTime() async {
//   DateTime? date = await pickDate();
//   if (date == null) return;
//   TimeOfDay? time = await pickTime();
//   if (time == null) return;
//   final dateTime = 

// }

// Future<DateTime?> pickDate() => showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2022),
//       lastDate: DateTime(2100),
//     );

// Future<TimeOfDay?> pickTime() => showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
