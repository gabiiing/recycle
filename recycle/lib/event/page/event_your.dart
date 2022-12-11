import 'package:flutter/material.dart';
import '../model/event.dart';
import '../method/event_method.dart';
import 'package:recycle/drawer.dart';

class YourEventPage extends StatefulWidget {
  const YourEventPage({super.key});

  @override
  State<StatefulWidget> createState() => _YourEventPage();
}

class _YourEventPage extends State<YourEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Events"),
      ),
      drawer: const ExternalDrawer(),
      body: FutureBuilder<List<Event>>(
        future: getMyEvents(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.brief),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
