import 'package:flutter/material.dart';
import 'package:my_feed/src/models/youtube_response.dart';
import 'package:my_feed/src/services/network_service.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var obj = {
    'title': "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
        " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
        "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        " It has survived not only five centuries, but also the leap into electronic typesetting,"
        " remaining essentially unchanged. It was popularised in the 1960s with the release of "
        "Letraset sheets containing Lorem Ipsum passages, and more recently "
        "with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    'subtitle':
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {},
          )
        ],
      ),
      body: FutureBuilder<List<Youtube>>(
          future: NetworkService.fetchYoutubeGET(type: "superhero"),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return buildListView(snapshot.data);
            }
            return Text(snapshot.error);
          }
      ),
    );
  }
}

ListView buildListView(List<Youtube> data) {
  return ListView.builder(
    itemBuilder: (BuildContext context, int index) {

      var item = data[index];

      return Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                item.subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
//              leading: CircleAvatar(
//                  backgroundImage: NetworkImage(
//                      "https://mymodernmet.com/wp/wp-content/uploads/2019/07/russian-blue-cats-17.jpg")),
              leading: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      "https://mymodernmet.com/wp/wp-content/uploads/2019/07/russian-blue-cats-17.jpg"),
                ),
              ),
            ),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-sg_Zy3KvCPLENEg6B5tsRS3K5vgPAM56V1tqZg5QdnNdEkpq4g",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton.icon(
                  splashColor: Colors.blue,
                  onPressed: () {},
                  icon: Icon(Icons.thumb_up),
                  label: Text("Like"),
                ),
                FlatButton.icon(
                  splashColor: Colors.blue,
                  onPressed: () {},
                  icon: Icon(Icons.share),
                  label: Text("Shared"),
                )
              ],
            )
          ],
        ),
      );
    },
    itemCount: data.length,
  );
}
