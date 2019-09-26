import 'package:flutter/material.dart';
import 'package:seventheen_app/bloc/login_bloc.dart';
import 'package:seventheen_app/validators/shop_details validator.dart';

import 'Navigattion_page.dart';

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home_login();
  }
}
class _Home_login extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Firestore_bloc",
      home: MyHome(),
    );
  }

}

class MyHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHome();
  }

}

class _MyHome extends State<MyHome> {

  final _bloc = Login_bloc();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Bloc_Register'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          email(),
        Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0),),
        shop_name(),
          Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0),),
        shop_panno(),
          Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0),),
        shop_type(),
          Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0),),
          submitt(),
          Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0),),
          RaisedButton(
              color: Colors.white12,
              child: Text('Press'),
              onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Navigation_page())) ;
          })
        ],
      ),
    );
  }



  Widget submitt() {
    return StreamBuilder<bool>(
        stream: _bloc.submit,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData || !snapshot.hasError) {
            return RaisedButton(
              onPressed: (){
                button();
              },
            );
          }else{
            return CircularProgressIndicator();
          }
        }
        );
  }

//        if(!snapshot.hasData || snapshot.hasError {
//          _bloc.register().then((value){
//           Navigator.push(context, MaterialPageRoute(builder: (context) => Second_page())) ;
//        });
//        }else{
//
//        }


  Widget button(){
    _bloc.submits(true);
    _bloc.register();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Navigation_page())) ;
  }
  Widget button_two(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Navigation_page())) ;
  }

//  void user(){
//    _bloc.subm its(true);
//    _bloc.submitcheck().then((value){
//      if(value == 1){
//        _bloc.register().then((value){
//          Navigator
//        }
//        );
//      }
//    })
//  }

  Widget email(){
    return StreamBuilder(
      stream: _bloc.shop_email,
        builder: (context, AsyncSnapshot<String> snapshot){
        return TextField(
          onChanged: _bloc.shopemail,
          obscureText: true,
          decoration: InputDecoration(
           errorText: snapshot.error
          ),
        );
        });
  }
  Widget shop_name(){
    return StreamBuilder(
        stream: _bloc.shop_name,
        builder: (context, AsyncSnapshot<String> snapshot){
          return TextField(
            onChanged: _bloc.shopname,
            obscureText: true,
            decoration: InputDecoration(
                  errorText: snapshot.error
            ),
          );
        });
  }

  Widget shop_panno(){
    return StreamBuilder(
        stream: _bloc.shop_panno,
        builder: (context, AsyncSnapshot<String> snapshot){
          return TextField(
            onChanged: _bloc.shoppnno,
            obscureText: true,
            decoration: InputDecoration(

               errorText: snapshot.error
            ),
          );
        });
  }
  Widget shop_type(){
    return StreamBuilder(
      stream: _bloc.shop_type,
        builder:(context, AsyncSnapshot<String> snapshot){
      return TextField(
        onChanged: _bloc.shoptype,
        obscureText: true,
        decoration: InputDecoration(
            errorText: snapshot.error
        ),
      );
    });
  }
}

