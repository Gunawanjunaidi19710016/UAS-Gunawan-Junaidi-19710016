import 'package:flutter/material.dart';
import 'package:uas_news/splash.dart';
import 'package:uas_news/components/customListTile.dart';
import 'package:uas_news/model/article_model.dart';
import 'package:uas_news/services/api_services.dart';
import 'package:uas_news/navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
      routes: <String, WidgetBuilder>{
        'halaman': (BuildContext context) => new halaman(),
        'automotive': (BuildContext context) => new HomePage1(),
        'sport': (BuildContext context) => new HomePage2(),
        'profil': (BuildContext context) => new HomePage3(),
      },
    );
  }
}

class HomePage1 extends StatefulWidget {
  @override
  berita_auto createState() => berita_auto();
}

class HomePage2 extends StatefulWidget {
  @override
  berita_sp createState() => berita_sp();
}

class HomePage3 extends StatefulWidget {
  @override
  profil createState() => profil();
}

class berita_auto extends State<HomePage1> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Automotive News", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.grey[400]),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class berita_sp extends State<HomePage2> {
  ApiService2 client = ApiService2();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Sport News", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.grey[400]),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class profil extends State<HomePage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Profile Page"),
        backgroundColor: Colors.grey[400],
      ),
      backgroundColor: Colors.blue[600],
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage('lib/img/igun.jpeg'),
          ),
          Text(
            "",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          Text(
            "Gunawan Junaidi",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
          Text(
            "",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          Text(
            "19710016",
            style: TextStyle(
              color: Colors.cyan[50],
              fontSize: 18,
              letterSpacing: 2.5,
            ),
          ),
          SizedBox(
            height: 50.0,
            width: 150.0,
            child: Divider(
              color: Colors.white,
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.mode_edit_outlined,
                color: Colors.lightBlue[200],
              ),
              title: Text(
                "Kelas  : 5A SI Reguler BJM",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(Icons.call_outlined, color: Colors.grey),
              title: Text(
                "Kontak : 085251341901",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.home_outlined,
                color: Colors.indigo,
              ),
              title: Text(
                "Alamat : Anjir serapat km 7",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
