// import 'package:bhagwat_gita_app/chatbot.dart';
import 'package:bhagwat_gita_app/contact_us.dart';
import 'package:bhagwat_gita_app/councellers.dart';
import 'package:bhagwat_gita_app/pdf.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> videoUrls = [
    'https://www.youtube.com/watch?v=rhCoXURzD64&t=158s',
    'https://www.youtube.com/watch?v=Lp7-xqESQ-w',
    'https://www.youtube.com/watch?v=hmGgBL2cATY&t=180s',
    'https://www.youtube.com/watch?v=uUqKu_H8mkU',
    'https://www.youtube.com/watch?v=kPT0SNQRe-Q&t=63s',

    // Add more YouTube video URLs
  ];

  List<Article> articles = [
    Article(
      icon: Icons.psychology_alt_outlined,
      title: 'Mental Wellness',
      link:
          'https://medium.com/@kokoizuka/looking-for-a-compilation-of-wellness-articles-from-a-health-enthusiast-start-with-these-below-6d97e002a7c1',
    ),
    Article(
      icon: Icons.health_and_safety,
      title: 'Mental Health',
      link:
          'https://medium.com/@vinodhrajaraman/disciplining-your-way-to-mental-wellness-combating-depression-and-becoming-better-3faeb0b732a1',
    ),
    Article(
      icon: Icons.self_improvement,
      title: 'Self Exploration',
      link:
          'https://medium.com/@guptadhruv1345/my-story-of-self-exploration-happiness-20c6ef767bd9',
    ),
    Article(
      icon: Icons.psychology,
      title: 'What Is Mental Wellbeing?',
      link:
          'https://medium.com/@ajcameron_author/5-key-things-to-stay-mentally-healthy-e7fdb73e7378',
    ),
    Article(
      icon: Icons.book,
      title: 'Bhagwat Gita',
      link:
          'https://medium.com/illumination/8-life-lessons-from-bhagwat-gita-that-can-change-your-life-35a4ee2d6102',
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mind Mend",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                content(context),
                const SizedBox(height: 20),
                Column(
                  children: [
                    const Text(
                      "Articles",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                              // border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white24),
                          child: buildArticleList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Counselor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Contact Us',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CarouselSlider(
        items: videoUrls.map((url) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(url) ?? '',
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: false,
                progressIndicatorColor: Colors.blueAccent,
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(height: 250),
      ),
    );
  }

  Widget buildArticleList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
              child: ListTile(
                leading: Icon(articles[index].icon),
                title: Text(
                  articles[index].title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ArticleWebView(articles[index].link),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Councelling()));
    }
    if (index == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => YourPDFScreen()));
    }
    if (index == 3) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ContactUs()));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}

class Article {
  final IconData icon;
  final String title;
  final String link;

  Article({required this.icon, required this.title, required this.link});
}

class ArticleWebView extends StatelessWidget {
  final String link;

  const ArticleWebView(this.link);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Article',
        ),
      ),
      body: WebView(
        initialUrl: link,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
