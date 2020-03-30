import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'edit_contact.dart';
import '../modal/contact.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewContact extends StatefulWidget {
  final String id;
  ViewContact(this.id);
  
  @override
  _ViewContactState createState() => _ViewContactState(id);
}

class _ViewContactState extends State<ViewContact> {

  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  String id;
  _ViewContactState(this.id);
  Contact _contact;
  bool isLoading = true;

  getContact(id) async {
    _databaseReference.child(id).onValue.listen((event){
      setState(() {
        _contact = Contact.fromSnapshot(event.snapshot);
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    this.getContact(id);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}