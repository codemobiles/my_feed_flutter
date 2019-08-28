import 'package:flutter/material.dart';
import 'package:my_feed/src/models/youtube_response.dart';
import 'package:my_feed/src/services/auth_service.dart';
import 'package:my_feed/src/services/network_service.dart';
import 'package:my_feed/src/utils/constants.dart';
import 'package:my_feed/src/widgets/custom_confirm_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var dummyData = {
    'title':
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
    'subtitle': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
        "Lorem Ipsum has been the industry's standard dummy text ever since the "
        "1500s, when an unknown printer took a galley of type and scrambled it "
        "to make a type specimen book. It has survived not only five centuries"
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
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              showDialog(
                context: context,
                builder: (context) {
                  return CustomConfirmDialog(
                    title:
                        "${prefs.getString(Constant.USERNAME_PREF)} to Logout",
                    content: "Are you sure?",
                    onPressOK: () async {
                      await AuthService().logout();
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (Route<dynamic> route) => false);
                    },
                    onPressCancel: () {
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
          )
        ],
      ),
      body: FutureBuilder<List<Youtube>>(
          future: NetworkService.fetchYoutubeGET(type: "superhero"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildListView(snapshot.data);
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error),
              );
            }
            return CircularProgressIndicator();
          }),
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
