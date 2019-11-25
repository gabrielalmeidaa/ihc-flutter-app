class DataInstance {
  var testVar = "Teste Varável é mutável?";
  final itemNames = ["UnB - Banheiro Exemplo 1", "UnB - Banheiro Exemplo 2", "UnB - Banheiro Exemplo 3",  "UnB - Bebedouro Exemplo 1",  "UnB - Bebedouro Exemplo 2"];
  final itemPictures = ["images/1.jpg", "images/2.jpg", "images/3.jpg", "images/4.jpg", "images/5.jpg"];
  var itemRatings = [[2.0,1.0,2.0,1.0,1.0], [3.0,4.0,4.0,4.0,5.0], [5.0,4.0,5.0,5.0,4.0], [5.0,5.0,5.0,5.0,5.0], [4.0,5.0,4.0,4.0,3.0]];
  var currWaterFilter = false;
  var currBathroomFilter = false;
  var currGoodConditionFilter = false;
  var only_water_fountains = false;
  var only_bathrooms = false;
  var filters_saved = false;
  var only_in_good_condition = false;

  DataInstance._();

  static DataInstance _instance;

  static DataInstance get instance {
    return _instance ??= DataInstance._();
  }

  static void dispose() {
  _instance = null;
  }

  void saveFilters(){
    currBathroomFilter = only_bathrooms;
    currWaterFilter = only_water_fountains;
    currGoodConditionFilter = only_in_good_condition;
  }

  void reset_filters() {
      only_water_fountains = false;
      only_bathrooms = false;
      only_in_good_condition = false; 
  }
}