import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/widgets/horizontal_card.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}
enum Type{
  self,team
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  TextEditingController fromDateInput = TextEditingController();
  TextEditingController toDateInput = TextEditingController();
  Type _type = Type.self;
  @override
  void initState() {
    fromDateInput.text = ""; //set the initial value of text field
    toDateInput.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const Text(
                "Dashboard",
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0 , left: 8.0),
                    child: Column(
                    children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0,),
                          child: Row(
                           children: [
                             Icon(Icons.calendar_month, size: 40, color: Colors.grey.shade600,),
                             Padding(
                               padding: const EdgeInsets.only(right: 4.0 , left: 4.0),
                               child: Text("From",style: TextStyle( color: Colors.grey.shade600,),),
                             ),
                             SizedBox(
                               width: 123,
                               height: 22,
                               child: Padding(
                                 padding: const EdgeInsets.only(right: 4.0 , left: 4.0),
                                 child: TextField(
                                   // contentPadding: EdgeInsets.symmetric(vertical: -5),
                                   style: TextStyle(fontSize: 12.0, color: Colors.grey.shade400),
                                   controller: fromDateInput, //editing controller of this TextField
                                   decoration: InputDecoration(
                                     contentPadding: EdgeInsets.symmetric(vertical: -5, horizontal: 2),
                                     suffixIcon: Icon(Icons.arrow_drop_down, size: 12.0, color: Colors.grey.shade600,),
                                     enabledBorder: OutlineInputBorder(
                                       borderSide: BorderSide(
                                         width: 1, color: Colors.grey,
                                       ),
                                       borderRadius: BorderRadius.circular(40),
                                     ),
                                     filled: true, //<-- SEE HERE
                                     fillColor: Colors.white,
                                   ),
                                   readOnly: true,  //set it true, so that user will not able to edit text
                                   onTap: () async {
                                     DateTime? pickedDate = await showDatePicker(
                                         context: context, initialDate: DateTime.now(),
                                         firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                         lastDate: DateTime(2101)
                                     );
                                     if(pickedDate != null ){
                                       print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                       // String formattedDate = Date
                                       String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                       print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                       //you can implement different kind of Date Format here according to your requirement

                                       setState(() {
                                         fromDateInput.text = formattedDate; //set output date to TextField value.
                                       });
                                     }else{
                                       print("Date is not selected");
                                     }
                                   },
                                 ),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(right: 4.0 , left: 4.0),
                               child: Text("To", style: TextStyle( color: Colors.grey.shade600,),),
                             ),
                             SizedBox(
                               width: 123,
                               height: 22,
                               child: Padding(
                                 padding: const EdgeInsets.only(right: 4.0 , left: 4.0),
                                 child: TextField(
                                   // contentPadding: EdgeInsets.symmetric(vertical: -5),
                                   style: TextStyle(fontSize: 12.0, color: Colors.grey.shade400),
                                   controller: toDateInput, //editing controller of this TextField
                                   decoration: InputDecoration(
                                     contentPadding: EdgeInsets.symmetric(vertical: -5, horizontal: 2),
                                     suffixIcon: Icon(Icons.arrow_drop_down, size: 12.0, color: Colors.grey.shade600,),
                                     enabledBorder: OutlineInputBorder(
                                       borderSide: BorderSide(
                                         width: 1, color: Colors.grey,
                                       ),
                                       borderRadius: BorderRadius.circular(40),
                                     ),
                                     filled: true, //<-- SEE HERE
                                     fillColor: Colors.white,
                                   ),
                                   readOnly: true,  //set it true, so that user will not able to edit text
                                   onTap: () async {
                                     DateTime? pickedDate = await showDatePicker(
                                         context: context, initialDate: DateTime.now(),
                                         firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                         lastDate: DateTime(2101)
                                     );
                                     if(pickedDate != null ){
                                       print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                       // String formattedDate = Date
                                       String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                       print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                       //you can implement different kind of Date Format here according to your requirement

                                       setState(() {
                                         toDateInput.text = formattedDate; //set output date to TextField value.
                                       });
                                     }else{
                                       print("Date is not selected");
                                     }
                                   },
                                 ),
                               ),
                             ),
                           ],
                       ),
                        ),
                        Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text('Self'),
                              leading: Radio(
                                value: Type.self,
                                groupValue: _type,
                                onChanged: (value) {
                                  setState(() {
                                    _type = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text('Team'),
                              leading: Radio(
                                value: Type.team,
                                groupValue: _type,
                                onChanged: (value) {
                                  setState(() {
                                    _type = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  HorizontalCard(),
                  HorizontalCard(),
                  // HorizontalCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
