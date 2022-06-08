import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/main_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function saveFilters;
  final Map<String, bool> _filters;

  FiltersScreen(this.saveFilters, this._filters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget._filters["gluten"];
    _lactoseFree = widget._filters["lactose"];
    _vegan = widget._filters["vegan"];
    _vegetarian = widget._filters["vegetarian"];
    super.initState();
  }

  Widget _buildListTile(String title, var filter, Function updateValue) {
    return SwitchListTile(
      title: Text("${title}"),
      value: filter,
      subtitle: Text(
        "Only include ${title} meals",
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "Adjust your meal selection",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildListTile("Gluten-free", _glutenFree, (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }),
            _buildListTile("Lactose-free", _lactoseFree, (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }),
            _buildListTile("Vegan", _vegan, (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }),
            _buildListTile("Vegetarian", _vegetarian, (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            })
          ],
        )),
        TextButton.icon(
          icon: Icon(
            Icons.check,
            size: 26,
          ),
          label: Text(
            "Apply Filters",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          onPressed: () {
            final selectedfilters = {
              "gluten": _glutenFree,
              "lactose": _lactoseFree,
              "vegan": _vegan,
              "vegetarian": _vegetarian,
            };
            widget.saveFilters(selectedfilters);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 1),
                content: Text(
                  "Filters applied",
                  textAlign: TextAlign.center,
                ),
              ),
            );
            Navigator.of(context).popAndPushNamed("/");
          },
        ),
        SizedBox(
          height: 60,
        )
      ]),
    );
  }
}
