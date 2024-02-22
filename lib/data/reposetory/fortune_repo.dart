

import 'package:fortune/data/data_resourse/shared_preferance.dart';
import 'package:fortune/domin/model/data_model.dart';

class FortuneRepo {

  Future<DataModel> getData() async {
    return SharedPref.instance.loadData();
  }

  Future<void>saveData(dataModel)async{
    SharedPref.instance.saveData(dataModel);
  }
}
