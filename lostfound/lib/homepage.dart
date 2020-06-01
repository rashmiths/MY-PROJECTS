import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Authentication.dart';
import 'LoginRegister.dart';
import 'Mapping.dart';
import 'main.dart';
import 'PhotoUpload.dart';
import 'Posts.dart';
import 'package:firebase_database/firebase_database.dart';



class HomePage extends StatefulWidget
{
  HomePage
      ({
    this.auth,
    this.onSignedOut,

  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;



  @override
  State<StatefulWidget> createState()
  {
    return _HomepageState();
  }
}

class _HomepageState extends State<HomePage>
{
  List<Posts> postsList=[];
  void initState()
  {
    super.initState();
    DatabaseReference postsRef=FirebaseDatabase.instance.reference().child("Posts");
    
    postsRef.once().then((DataSnapshot snap)
    {
      var KEYS =snap.value.keys;
      var DATA =snap.value;

      postsList.clear();


      for (var individualKey in KEYS)
        {
          Posts posts = new Posts
            (
            DATA[individualKey]['image'],
            DATA[individualKey]['name'],
            DATA[individualKey]['phoneno'],
            DATA[individualKey]['location'],
            DATA[individualKey]['date'],
            DATA[individualKey]['time'],

          );

          postsList.add(posts);
        }
      setState(() {
        print('Length: $postsList.length');
      });

    });
  }

  void _logoutUser() async
  {
    try
    {
      await widget.auth.signOut();
      widget.onSignedOut();
    }
    catch(e)
    {
      print(e.toString());

    }

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Home"),
      ),
      body: new Container
        (
        child: postsList.length == 0 ? Text("no items added"):ListView.builder(
            itemCount: postsList.length,
            itemBuilder: (_,index)
            {
              return PostsUI(postsList[index].image,postsList[index].name,postsList[index].phoneno,postsList[index].location,postsList[index].date,postsList[index].time);
        
            }),

      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink,
        child: Container
         (
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize:MainAxisSize.max ,
            children: <Widget>
            [
              new IconButton(
                  icon: Icon( Icons.home),
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: _logoutUser),
              new IconButton(
                  icon: Icon( Icons.add_a_photo),
                  iconSize: 40,
                  color: Colors.white,
                  onPressed:()
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)
                    {
                      return new UploadPhotoPage();
                    }));
              })
              
            ],
          ),


        ),
      ),

    );

  }

  Widget PostsUI(String image,String name,String phoneno,String location,String date,String time)
  {
    return Card
      (
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: Container
        (
        padding: EdgeInsets.all(14.0),

        child: Column
          (
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  date,
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            
            new Image.network(image,fit:BoxFit.cover ,),
            Text(
              name,
              style: Theme.of(context).textTheme.subhead,
              textAlign: TextAlign.center,
            ),
            Text(
              phoneno,
              style: Theme.of(context).textTheme.subhead,
              textAlign: TextAlign.center,
            ),
            Text(
              location,
              style: Theme.of(context).textTheme.subhead,
              textAlign: TextAlign.center,
            ),


          ],
        ),
      )


    );
  }
}