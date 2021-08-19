import 'package:flutter/cupertino.dart';
import 'package:providersample/model/listresponse.dart';
import 'package:providersample/rest/api.dart';
enum Status { Unintialize,Feteched,Fetching,Failed}
class Listprovider extends ChangeNotifier
{
  Status _status=Status.Unintialize;
  Status get status=>_status;
  List<Listresponse?> listresponse=[];
  Future<List<Listresponse?>>getlist() async
  {
    await Api().getlist().then((value)
    {
      _status=Status.Fetching;
      notifyListeners();
      if(value!=null)
        {
          listresponse=value;
          _status=Status.Feteched;
          notifyListeners();
        }else
          {
            _status=Status.Failed;
            notifyListeners();
          }
    });
    print(_status);
    return listresponse;

  }
}