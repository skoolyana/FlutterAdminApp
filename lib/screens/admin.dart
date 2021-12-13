import 'package:flutter/material.dart';
import 'package:sunil_wale_admin/screens/db/Brand.dart';
import 'package:sunil_wale_admin/screens/db/Category.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'add_product.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectedPage = Page.manage;
  MaterialColor active = Colors.red;
  MaterialColor not_active = Colors.grey;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  GlobalKey _categoryformKey = new GlobalKey();
  GlobalKey _brandformKey = new GlobalKey();
  BrandService _brandService = new BrandService();
  CategoryService _categoryService = new CategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
                child: TextButton.icon(
                    onPressed: () {
                      setState(() => _selectedPage = Page.dashboard);
                      {}
                    },
                    icon: Icon(
                      Icons.dashboard,
                      color:
                          _selectedPage == Page.dashboard ? active : not_active,
                    ),
                    label: Text('Dashboard'))),
            Expanded(
                child: TextButton.icon(
                    onPressed: () {
                      setState(() => _selectedPage = Page.manage);
                      {}
                    },
                    icon: Icon(
                      Icons.sort,
                      color: _selectedPage == Page.manage ? active : not_active,
                    ),
                    label: Text('Manage'))),
          ],
        ),
        elevation: 1.0,
        backgroundColor: Colors.white,
      ),
      body: _loadScreen(),
    );
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: <Widget>[
            ListTile(
              subtitle: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.attach_money,
                  size: 30.0,
                  color: Colors.green,
                ),
                label: Text('12,000',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0, color: Colors.green)),
              ),
              title: Text(
                'Revenue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
            ),
            Expanded(
                child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.people_outline),
                          label: Text("Users")),
                      subtitle: Text(
                        "7",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: active, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.category),
                          label: Text(
                            "Categories",
                            style: TextStyle(fontSize: 13.1),
                          )),
                      subtitle: Text(
                        "23",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: active, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.track_changes),
                          label: Text("Products")),
                      subtitle: Text(
                        "120",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: active, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.tag_faces),
                          label: Text("Sold")),
                      subtitle: Text(
                        "13",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: active, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.shopping_cart),
                          label: Text("Orders")),
                      subtitle: Text(
                        "5",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: active, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.close),
                          label: Text("Return")),
                      subtitle: Text(
                        "0",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: active, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
              ],
            ))
          ],
        );
        break;

      case Page.manage:
        return ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add Product"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (_)=> AddProduct()));
              }
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.change_history),
              title: Text("Products List"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle),
              title: Text("Add Category"),
              onTap: () {
                _categoryAlert();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Category List"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text("Adds Brand"),
              onTap: () {
                _brandAlert();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Brand List"),
              onTap: () {},
            ),
          ],
        );
        break;

      default:
        return Container();
    }
  }

  void _categoryAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _categoryformKey,
        child: TextFormField(
          controller: categoryController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Category Cannot be empty";
            }
          },
          decoration: InputDecoration(
            hintText: "Add Category",
          ),
        ),
      ),
      actions: <Widget>[
        TextButton.icon(
            onPressed: () {
              if (categoryController.text != null) {
                _categoryService.createCategory(categoryController.text);
                Fluttertoast.showToast(msg: "Category Created");
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.add),
            label: Text("Add")),
        TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            label: Text("Cancel"))
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }

  void _brandAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _brandformKey,
        child: TextFormField(
          controller: brandController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Brand Cannot be empty";
            }
          },
          decoration: InputDecoration(
            hintText: "Add Brand",
          ),
        ),
      ),
      actions: <Widget>[
        TextButton.icon(
            onPressed: () {
              if (brandController.text != null) {
                _brandService.createBrand(brandController.text);
                Fluttertoast.showToast(msg: "Brand Created");
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.add),
            label: Text("Add")),
        TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            label: Text("Cancel"))
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }
}
