import 'package:rxdart/rxdart.dart';
import 'package:seventheen_app/validators/shop_details validator.dart';
import 'dart:async';
import 'package:seventheen_app/repository/shop_details_repository.dart';


    // Written by Abiral Basnet
    // Date - 2019/09/24

class Login_bloc extends Object with shop_details_validator{

  //declaring controller as type
  final _emailcontroller = BehaviorSubject<String>();
  final _shopnamecontroller = BehaviorSubject<String>();
  final _shoppannocontrolller = BehaviorSubject<String>();
  final _tyoeofshopcontroller = BehaviorSubject<String>();
  final _submitcontroler = BehaviorSubject<bool>();
  final _repository = Shop_Details_Repository();


  //observables. hence to create the path to flow the data
  Stream<String> get shop_email => _emailcontroller..stream.transform(shop_email_validator);
  Stream<String> get shop_name => _shopnamecontroller.stream.transform(shop_name_validator);
  Stream<String> get shop_panno => _shoppannocontrolller.stream.transform(shop_panno_validator);
  Stream<String> get shop_type => _tyoeofshopcontroller.stream.transform(shop_type_validator);
  Stream<bool> get submit => _submitcontroler.stream;

  //To insert a data

  Function(String) get shopemail => _emailcontroller.sink.add;
  Function(String) get shopname => _shopnamecontroller.sink.add;
  Function(String) get shoppnno => _shoppannocontrolller.sink.add;
  Function(String) get shoptype => _tyoeofshopcontroller.sink.add;
  Function(bool)  get submits => _submitcontroler.sink.add;


  Future<void> register() {
    return _repository.registers(_emailcontroller.value, _shopnamecontroller.value, _shoppannocontrolller.value, _tyoeofshopcontroller.value).then((value){
      _submitcontroler.sink.add(false);
    });
  }

//  Stream<bool> submitcheck() => Observable.combineLatest4(_emailcontroller, _shopnamecontroller, _shoppannocontrolller, _tyoeofshopcontroller, (e,n,p,t) => true);

//  Future<>

  void dispose() async{
    await _emailcontroller.drain();
    _emailcontroller.close();
    await _shopnamecontroller.drain();
    _shopnamecontroller.close();
    await _shoppannocontrolller.drain();
    _shoppannocontrolller.close();
    await _tyoeofshopcontroller.drain();
    _tyoeofshopcontroller.close();

  }




}