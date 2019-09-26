import 'package:flutter/material.dart';


class Navigation_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Navigation_page();
  }
}

class _Navigation_page extends State<Navigation_page> {

  int my_index = 0;

  void ontapped(index){
    setState(() {
      my_index = index;
    });
  }

  Widget Home(){
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Wnter a Number"
        ),
      ),
    );
  }

    List<Widget> _list = [
    ContentPage(),
     Text(
       'fd'
     ),
    Text("dghf")
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Distionary'),),
      body: _list [my_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: my_index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.save_alt, color: Colors.white12,),
            title: Text("List"),),
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.red,),
              title: Text("Home"),),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox, color: Colors.purple,),
              title: Text("About Us"),

            ),
          ],
        onTap: (index){
            ontapped(index);
        },
      ),
    );
  }
}

