class LocationModel {
  final String name;
  final String airQualityAndTemperature;
  final String currentTemperature;
  final bool isSelected;

  LocationModel({
    required this.name,
    required this.airQualityAndTemperature,
    required this.currentTemperature,
    this.isSelected = false,
  });
}