import 'package:flutter/material.dart';
import '../model/event.dart';
import '../method/event_method.dart';
import 'package:recycle/drawer.dart';
import 'package:recycle/Authentication/page/login_page.dart';

class YourEventPage extends StatefulWidget {
  const YourEventPage({super.key});

  @override
  State<StatefulWidget> createState() => _YourEventPage();
}

class _YourEventPage extends State<YourEventPage> {
  late EventMethod data;
  late Future<List<Event>> _event;
  @override
  void initState() {
    super.initState();
    setState(() {
      data = EventMethod();
      _event = data.getMyEvents(userData!['idUser']);
      
    });
 
  }

  Widget buildTextButton(int index, int id) {
    
    
    if (true) {
      return TextButton(
        
        onPressed: () {
          setState(() {
            
            
          });
             deleteEvent(id);
        },
        child: Icon(Icons.delete) ,
      );
    } else {
      return const Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Events"),
      ),
      drawer: const ExternalDrawer(),
      body: FutureBuilder<List<Event>>(
        future: _event,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return ListTile(
                  title: Text(item.fields.title),
                  subtitle: Text(item.fields.startDate.toString()),
                  trailing: buildTextButton(index, item.pk),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      // add button in the bottom right corner
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
