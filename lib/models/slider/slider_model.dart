import 'package:my_boilerplate/constants/assets.dart';

class SliderModel {
  String? imageAssetPath;
  String? desc;
  String? title;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath!;
  }

  String getTitle() {
    return title!;
  }

  String getDesc() {
    return desc!;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("slideDesc1");
  sliderModel.setTitle("slideTitle1");

  sliderModel.setImageAssetPath(Assets.slideImages1);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("slideDesc2");
  sliderModel.setTitle("slideTitle2");

  sliderModel.setImageAssetPath(Assets.slideImages2);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("slideDesc3");
  sliderModel.setTitle("slideTitle3");

  sliderModel.setImageAssetPath(Assets.slideImages3);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
