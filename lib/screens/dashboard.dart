import 'package:FlutterPersistenciaDados/screens/villains_list.dart';
import 'package:flutter/material.dart';

import 'heroes_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.wb_auto),
        title: Text('The Avengers'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/marvel.png'),
          ),Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HeroesList(),)
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      height: 100,
                      width: 150,
                      color: Theme.of(context).primaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.people,size: 32.0,),
                          Text('Heroes')
                        ],
                      ),
                    ),
                  ),
                ),
              ),Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => VillainsList(),));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      height: 100,
                      width: 150,
                      color: Theme.of(context).primaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.people_outline,size: 32.0,),
                          Text('Villains')
                        ],
                      ),
                    ),
                  ),
                ),

              )
            ],
          )

        ],
      ),
    );
  }
}