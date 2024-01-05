import 'package:flutter/material.dart';

void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController datecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("DATE PICKER")),backgroundColor: Colors.grey),backgroundColor: Colors.blueGrey,
      body: Center(child: Padding(padding: EdgeInsets.all(30),
        child: TextField(
          controller: datecontroller,
          decoration: InputDecoration(hintText: "DATE",
            filled: true,prefixIcon: Icon(Icons.calendar_today,),enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),),
          ),readOnly: true,
          onTap: () {
            selectDate ();
          },
        ),

      )),

    );
  }
  Future<void> selectDate() async {
    DateTime? picked=await showDatePicker(
        context:context,
        initialDate:DateTime.now(),
        firstDate:DateTime(2000),
        lastDate:DateTime(2100)
    );
    if(picked!=null){
      setState(() {
        datecontroller.text=picked.toString().split(" ")[0];
      });
    }
  }
}
