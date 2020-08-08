import 'package:ecom_app/repository/repository.dart';

class SliderService {
  Repository _repository;
  SliderService(){
    _repository = Repository();
  }

  getSliders() async {
    return await _repository.httpGet('sliders');
  }
}