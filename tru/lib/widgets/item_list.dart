import 'package:flutter/material.dart';
import 'package:tru/model/my_data.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<Map> staticData = MyData.data;
  Map<int, bool> selectedFlag = {};
  bool isSelectionMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (builder, index) {
          Map data = staticData[index];
          selectedFlag[index] = selectedFlag[index] ?? false;
          bool? isSelected = selectedFlag[index];
          return ListTile(
            title: Text("${data['name']}"),
            subtitle: Text("${data['email']}"),
            leading: CircleAvatar(
              child: Text('${data['id']}'),
            ),
          );
        },
        itemCount: staticData.length,
      ),
    );
  }
}

class MultiSelectListView extends StatefulWidget {
  @override
  _MultiSelectListViewState createState() => _MultiSelectListViewState();
}

class _MultiSelectListViewState extends State<MultiSelectListView> {
  List<String> emails = List.generate(20, (index) => "Email $index");
  Set<int> selectedIndexes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Selection ListView (Gmail Style)'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                emails.removeWhere(
                    (email) => selectedIndexes.contains(emails.indexOf(email)));
                selectedIndexes.clear();
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: emails.length,
        itemBuilder: (context, index) {
          final email = emails[index];
          return ListTile(
            title: Text(email),
            onTap: () {
              setState(() {
                if (selectedIndexes.contains(index)) {
                  selectedIndexes.remove(index);
                  print("Run");
                } else {
                  selectedIndexes.add(index);
                }
              });
            },
            selected: selectedIndexes.contains(index),
            selectedTileColor: Colors.blue.withOpacity(0.5),
          );
        },
      ),
    );
  }
}
