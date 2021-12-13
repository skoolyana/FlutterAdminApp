import 'package:flutter/material.dart';
import 'dart:convert';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color red = Colors.red;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController productNameCotroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: white,
        leading: Icon(Icons.close, color: black),
        title: Text(
          "Add Products",
          style: TextStyle(color: black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () {},
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 30.0, 14.0, 30.0),
                          child: Icon(
                            Icons.add,
                            color: grey,
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () {},
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 30.0, 14.0, 30.0),
                          child: Icon(
                            Icons.add,
                            color: grey,
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () {},
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 30.0, 14.0, 30.0),
                          child: Icon(
                            Icons.add,
                            color: grey,
                          ),
                        )),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("You must Enter 10 characters at maximum ",textAlign: TextAlign.center, style: TextStyle(color: red, fontSize: 13.0,),),
            ),

            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                controller: productNameCotroller,
                decoration: InputDecoration(hintText: 'Product Name'),
                validator: (value){
                  if(value!.isEmpty)
                    {
                      return "You must Enter The Product Name";
                    }
                  else if(value.length > 10)
                    {
                      'Product Name cannot be more than 10 letters.';

                    }
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
