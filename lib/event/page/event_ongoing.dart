import 'package:flutter/material.dart';
import '../model/event.dart';
import '../method/event_method.dart';
import 'package:recycle/drawer.dart';
import 'package:recycle/Authentication/page/login_page.dart';
import 'package:recycle/event/page/event_form.dart';
import 'package:recycle/forum/pages/forum.dart';
import '../utils/styles/app_styles.dart';

class OngoingEventPage extends StatefulWidget {
  const OngoingEventPage({super.key});

  @override
  State<StatefulWidget> createState() => _OngoingEventPage();
}

class _OngoingEventPage extends State<OngoingEventPage> {
  late EventMethod data;
  late Future<List<Event>> _event;
  @override
  void initState() {
    super.initState();
    setState(() {
      data = EventMethod();
      _event = data.getOngoingEvents();
    });
  }

  Widget buildTextButton(int index, int id) {
    return TextButton(
      onPressed: () {
        deleteEvent(id).then((value) => setState(
              () {
                _event = data.getMyEvents(userData!['idUser']);
              },
            ));
      },
      child: Icon(Icons.delete),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ongoing Events"),
      ),
      drawer: const ExternalDrawer(),
      body: FutureBuilder<List<Event>>(
        future: _event,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(child: const Text("Belum ada Event yang berjalan"));
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                String jam = item.fields.startDate
                        .toString()
                        .split(" ")[1]
                        .substring(0, 8) +
                    " WIB";
                String tanggal = item.fields.startDate
                        .toString()
                        .split(" ")[0]
                        .split("-")[2] +
                    "/" +
                    item.fields.startDate
                        .toString()
                        .split(" ")[0]
                        .split("-")[1] +
                    "/" +
                    item.fields.startDate
                        .toString()
                        .split(" ")[0]
                        .split("-")[0];
                print(tanggal);
                print(jam);

                String jamf = item.fields.finishDate
                        .toString()
                        .split(" ")[1]
                        .substring(0, 8) +
                    " WIB";
                String tanggalf = item.fields.finishDate
                        .toString()
                        .split(" ")[0]
                        .split("-")[2] +
                    "/" +
                    item.fields.startDate
                        .toString()
                        .split(" ")[0]
                        .split("-")[1] +
                    "/" +
                    item.fields.startDate
                        .toString()
                        .split(" ")[0]
                        .split("-")[0];
                return ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      // add padding
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/Recycle-icon.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(item.fields.title, style: Styles.h2,),
                  subtitle: Text(item.fields.brief+ "\n\n"+ "Mulai :" + tanggal + "\t" + jam+ "\nSelesai :" + tanggalf + "\t" + jamf, style: Styles.h4 ),
                  trailing: Visibility(
                    visible: userData!['isSuperuser'],
                    child: buildTextButton(index, item.pk),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Forum(
                          id: item.pk,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      // add button in the bottom right corner

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Visibility(
                visible: true,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: const Icon(Icons.arrow_back_ios),
                )),
          ],
        ),
      ),
    );
  }
}
