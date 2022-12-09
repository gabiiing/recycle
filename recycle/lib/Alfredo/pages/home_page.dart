import 'package:flutter/material.dart';
import 'package:recycle/Alfredo/pages/form_question.dart';
import 'package:recycle/Alfredo/pages/question_page.dart';
import 'package:recycle/Alfredo/widgets/customAppBar.dart';
import 'package:recycle/Authentication/page/login_page.dart';
import 'package:recycle/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const ExternalDrawer(),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight, context),
          // _buildSizedBox(screenHeight),
          _buildBody(screenHeight),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

SliverToBoxAdapter _buildHeader(double screenHeight, BuildContext context) {
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Text(
                "${"Welcome " + userData!['username']}!",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'INTRODUCING RE.CYCLE!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              const Text(
                'Sebuah platform yang memberikan informasi terkait daur ulang sampah & mengajak masyarakat untuk melakukan daur ulang sampah.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuestionPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        textStyle: const TextStyle()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.question_answer, size: 20),
                              ),
                              TextSpan(text: " "),
                              TextSpan(
                                text: "See FAQ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FormQuestion()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        textStyle: const TextStyle()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.question_mark,
                                  size: 20,
                                ),
                              ),
                              TextSpan(text: " "),
                              TextSpan(
                                text: "Ask Question",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}

SliverToBoxAdapter _buildSizedBox(double screenHeight) {
  return SliverToBoxAdapter(
    child: SizedBox(height: screenHeight * 0.001),
  );
}

SliverToBoxAdapter _buildBody(double screenHeight) {
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.all(40.0),
      // decoration: const BoxDecoration(
      //   color: Color.fromARGB(255, 74, 188, 80),
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(40.0),
      //     topRight: Radius.circular(40.0),
      //   ),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'OBJECTIVES',
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
              // color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.02),
          const Text(
            'Kami ingin menyediakan sarana bagi masyarakat dalam bentuk aplikasi. Melalui fitur-fitur seperti event, kami berharap seluruh pengunjung website dapat turut berpartisipasi dalam mewujudkan kebersihan lingkungan yang lebih baik lagi. ',
            style: TextStyle(
              // color: Colors.white70,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: screenHeight * 0.01),
          const Text(
            'Kami merasa bahwa informasi mengenai kegiatan daur ulang yang dapat dihadiri masyarakat belum tersebar dengan baik, sehingga kami berharap aplikasi ini dapat memicu kesadaran masyarakat mengenai kebersihan dan kesehatan lingkungan.',
            style: TextStyle(
              // color: Colors.white70,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: screenHeight * 0.01),
          const Text(
            'Baca selengkapnya di website kami!',
            style: TextStyle(
                // color: Colors.white70,
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          ElevatedButton(
            onPressed: () {
              Uri registerUrl =
                  Uri.parse("https://pbp-d01.up.railway.app/#part2");
              launchUrl(registerUrl);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                textStyle: const TextStyle()),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.read_more),
                      ),
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Read More",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}
