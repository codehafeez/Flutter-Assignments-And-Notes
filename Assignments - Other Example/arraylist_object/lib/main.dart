import 'package:flutter/material.dart';

import 'person.dart';
void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Person> persons= [];

  @override
  void initState() {
    persons.add(Person(id:"1", name:"Abdul", age:'20'));
    persons.add(Person(id:"2", name:"Noman", age:'22'));
    persons.add(Person(id:"3", name:"Ali", age:'23'));
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("Add And Delete Item List"),
          backgroundColor: Colors.redAccent,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              persons.add(Person(id:"4", name:"Hafeez", age:'25'));
            });
          },
          backgroundColor: Colors.redAccent,
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: persons.map((personone){
                return Container(
                  child: Card(
                    child:ListTile(
                      title: Text(personone.name),
                      subtitle: Text(personone.age),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent
                        ),
                        child: Icon(Icons.delete),
                        onPressed: (){
                          persons.removeWhere((element){
                            return element.id == personone.id;
                          });
                          setState(() {
                            //refresh UI after deleting element from list
                          });
                        },
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
    );
  }
}
