import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providersample/providerapi/listviewprovider.dart';

class Listview extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Listview();
  }



}

class _Listview extends State<Listview> {




  @override
  Widget build(BuildContext context) {



    var provider=Provider.of<Listprovider>(context,listen: true);
    // TODO: implement build
    return Scaffold(

      body: provider.status==Status.Feteched?ListView.builder(itemCount:provider.listresponse.length,itemBuilder:(context,index)
      {
        return ListTile(title: Text(provider.listresponse[index]!.fullName),subtitle: Text("empty"),);
      }):Center(child:CircularProgressIndicator()),


    );
  }

  @override
  void initState() {
    Provider.of<Listprovider>(context,listen: false).getlist().then((value)
    {

      print(value[0]!.fullName );

    });

  }
}