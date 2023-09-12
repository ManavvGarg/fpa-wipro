import 'package:flutter/material.dart';
import 'package:Fixed_Point_Adherence/models/zone_details.dart';
import 'package:Fixed_Point_Adherence/submit_form.dart';
import 'package:Fixed_Point_Adherence/submit_form_newLocation.dart';


class NewLocationEntryForm extends StatefulWidget {
  const NewLocationEntryForm({super.key});

  @override
  State<NewLocationEntryForm> createState() => _NewLocationEntryFormState();
}

class _NewLocationEntryFormState extends State<NewLocationEntryForm> {

  // constructor of the form class
  _NewLocationEntryFormState() {
    _selected_plant = "";
    _selected_zone = "";
  }


  // declare enums here
  // PathTypeEnum? _pathTypeEnum;

  // declare controllers here
  final TextEditingController _plant_name_Controller = TextEditingController();
  final TextEditingController _zone_name_Controller = TextEditingController();
  final TextEditingController _zone_leader_Controller = TextEditingController();

  // declare variables here
  final _plantList = ["Avadi", "Kelambakkam", "T Nagar", "Anna Nagar", "Vandalur"];
  final _zoneList = [
    "Burnishing Bay", "SCP Main Gangway", "SCP & Maintenance", "SCP & Material Storage", "FG & Packing 1",
    // "Zone 6", "Zone 7", "Zone 8", "Zone 9", "Zone 10",
    // "Zone 11", "Zone 12", "Zone 13", "Zone 14", "Zone 15",
    // "Zone 16", "Zone 17", "Zone 18", "Zone 19", "Zone 20"
  ];

  String? _selected_plant = "";
  String? _selected_zone = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: ListView(

        children: [

          const SizedBox(

            height: 50,
            width: 50,

            child: Image(

              image: AssetImage('images/wipro_logo.png'),
            ),

          ),

          const SizedBox(height: 20,),

          const Text("New Location Data Entry",

            textAlign: TextAlign.center,

            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 59, 57, 57),
            ),

          ),

          const SizedBox(height: 20,),

          /* Form for data entry */
          Form(

              key: _formKey,

              child: Column(

                children: [

                  // enter new plant
                  TextFormField(

                    controller: _plant_name_Controller,

                    decoration: const InputDecoration(
                      labelText: "Enter Plant Name",
                      prefixIcon: Icon(
                          Icons.person,
                          color: Colors.deepPurple
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 40,),

                  // enter new zone
                  TextFormField(

                    controller: _zone_name_Controller,

                    decoration: const InputDecoration(
                      labelText: "Enter Zone Name",
                      prefixIcon: Icon(
                          Icons.person,
                          color: Colors.deepPurple
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 40,),

                  TextFormField(

                    controller: _zone_leader_Controller,

                    decoration: const InputDecoration(
                      labelText: "Enter Zone Leader",
                      prefixIcon: Icon(
                          Icons.person,
                          color: Colors.deepPurple
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 40,),

                  // button for submitting data
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [

                      ElevatedButton(

                        style: ElevatedButton.styleFrom(

                          textStyle: TextStyle(fontWeight: FontWeight.bold),

                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(100, 50),
                        ),

                        onPressed: () {

                          if (_formKey.currentState!.validate()) {

                            NewLocationDetails newLocationDetails = NewLocationDetails();

                            newLocationDetails.plantName = _plant_name_Controller.text;
                            newLocationDetails.zoneName = _zone_name_Controller.text;
                            newLocationDetails.zoneLeader = _zone_leader_Controller.text;

                            // Go to submit page
                            Navigator.push(context, MaterialPageRoute(builder: (context) {

                              return NewLocationDetailsSubmitForm(newLocationDetails: newLocationDetails,);

                            }));

                          }

                        },
                        child: const Row(

                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(
                              Icons.done,
                              color: Colors.deepPurple,
                            ),
                            SizedBox(width: 10,),
                            Text('Submit'),
                          ],
                        ),

                      ),
                    ],

                  )

                ],

              )

          ),
          SizedBox(height: 10,),

          ElevatedButton(
            onPressed: () {

            },
            child: const Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Icon(
                  Icons.file_download,
                  color: Colors.deepPurple,
                ),
                SizedBox(width: 10,),
                Text('Generate Excel'),
              ],
            ),
          )

        ],
      ),
    );
  }
}