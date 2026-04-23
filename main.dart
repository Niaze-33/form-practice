import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String roll = "";
  String reg = "";
  String blood = "A+";
  String gender = "";
  String phone = "";
  String about = "";

  String output = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Form")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            TextFormField(
              decoration: InputDecoration(labelText: "Name"),
              onChanged: (val) => name = val,
            ),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Roll"),
                    onChanged: (val) => roll = val,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Registration"),
                    onChanged: (val) => reg = val,
                  ),
                ),
              ],
            ),

            DropdownButtonFormField(
              value: blood,
              items: ["A+", "B+", "O+", "AB+"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => blood = val.toString(),
              decoration: InputDecoration(labelText: "Blood Group"),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Gender"),
                Row(
                  children: [
                    Radio(
                      value: "Male",
                      groupValue: gender,
                      onChanged: (val) {
                        setState(() {
                          gender = val.toString();
                        });
                      },
                    ),
                    Text("Male"),
                    Radio(
                      value: "Female",
                      groupValue: gender,
                      onChanged: (val) {
                        setState(() {
                          gender = val.toString();
                        });
                      },
                    ),
                    Text("Female"),
                  ],
                ),
              ],
            ),

            TextFormField(
              decoration: InputDecoration(labelText: "Phone"),
              onChanged: (val) => phone = val,
            ),

            TextFormField(
              decoration: InputDecoration(labelText: "About Me"),
              maxLines: 3,
              onChanged: (val) => about = val,
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  output = """
Name: $name
Roll: $roll
Registration: $reg
Blood Group: $blood
Gender: $gender
Phone: $phone
About: $about
""";

                  // Reset values
                  name = "";
                  roll = "";
                  reg = "";
                  phone = "";
                  about = "";
                  gender = "";
                });
              },
              child: Text("Submit"),
            ),

            SizedBox(height: 20),

            if (output.isNotEmpty)
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.green[100],
                child: Text(output),
              ),
          ],
        ),
      ),
    );
  }
}
