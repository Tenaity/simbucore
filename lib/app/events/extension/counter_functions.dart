// Counter functions for maps


// Add new values with a count of 1, increment existing values
Map<String, int> addOrIncrementValue(Map<String, int> mapCounter, String value){
    if (mapCounter.containsKey(value)){
      mapCounter[value] = (mapCounter[value]! + 1);
    }
    else {
      mapCounter[value] = 1;
    }
    
    return mapCounter;
}