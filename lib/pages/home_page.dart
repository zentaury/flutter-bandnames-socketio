import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:band_names/models/band_model.dart';

class HomePage extends StatefulWidget {
  static final pageName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 5),
    Band(id: '2', name: 'Megadeth', votes: 4),
    Band(id: '3', name: 'Anthrax', votes: 3),
    Band(id: '4', name: 'Slayer', votes: 2),
    Band(id: '5', name: 'Mastodont', votes: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Band Names',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => _bandTile(bands[i]),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        child: Icon(Icons.add),
        onPressed: _addNewBand,
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('direction: $direction');
        print('band:' + band.name);
        //llamar el borrado en el server
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
              Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text(
          '${band.votes}',
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }

  _addNewBand() {
    final textController = new TextEditingController();

    if (Platform.isAndroid) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New Band Name:'),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                child: Text('Add'),
                elevation: 5,
                textColor: Colors.blue,
                onPressed: () => _addBandToList(textController.text),
              ),
            ],
          );
        },
      );
    }

    showCupertinoDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: Text('New Band Name'),
          content: CupertinoTextField(
            controller: textController,
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Add'),
              onPressed: () => _addBandToList(textController.text),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              isDefaultAction: true,
              child: Text('Dismiss'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  void _addBandToList(String name) {
    print(name);
    if (name.length > 1) {
      this
          .bands
          .add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
