class BreastCancerModel {
  final double? radiusMean;
  final double? textureMean;
  final double? perimeterMean;
  final double? areaMean;
  final double? smoothnessMean;
  final double? compactnessMean;
  final double? concavityMean;
  final double? concavePointsMean;
  final double? symmetryMean;
  final double? fractalDimensionMean;

  final double? radius_se;
  final double? texture_se;
  final double? perimeter_se;
  final double? area_se;
  final double? smoothness_se;
  final double? compactness_se;
  final double? concavity_se;
  final double? concave_points_se;
  final double? symmetry_se;
  final double? fractal_dimension_se;

  final double? radius_worst;
  final double? texture_worst;
  final double? perimeter_worst;
  final double? area_worst;
  final double? smoothness_worst;
  final double? compactness_worst;
  final double? concavity_worst;
  final double? concave_points_worst;
  final double? symmetry_worst;
  final double? fractal_dimension_worst;

  BreastCancerModel({
    required this.radiusMean,
    required this.textureMean,
    required this.perimeterMean,
    required this.areaMean,
    required this.smoothnessMean,
    required this.compactnessMean,
    required this.concavityMean,
    required this.concavePointsMean,
    required this.symmetryMean,
    required this.fractalDimensionMean,
    required this.radius_se,
    required this.texture_se,
    required this.perimeter_se,
    required this.area_se,
    required this.smoothness_se,
    required this.compactness_se,
    required this.concavity_se,
    required this.concave_points_se,
    required this.symmetry_se,
    required this.fractal_dimension_se,
    required this.radius_worst,
    required this.texture_worst,
    required this.perimeter_worst,
    required this.area_worst,
    required this.smoothness_worst,
    required this.compactness_worst,
    required this.concavity_worst,
    required this.concave_points_worst,
    required this.symmetry_worst,
    required this.fractal_dimension_worst,
  });

  factory BreastCancerModel.fromJson(Map<String, dynamic> json) {
    return BreastCancerModel(
      radiusMean: json['radiusMean'] ?? 0,
      textureMean: json['textureMean'] ?? 0,
      perimeterMean: json['perimeterMean'] ?? 0,
      areaMean: json['areaMean'] ?? 0,
      smoothnessMean: json['smoothnessMean'] ?? 0,
      compactnessMean: json['compactnessMean'] ?? 0,
      concavityMean: json['concavityMean'] ?? 0,
      concavePointsMean: json['concavePointsMean'] ?? 0,
      symmetryMean: json['symmetryMean'] ?? 0,
      fractalDimensionMean: json['fractalDimensionMean'] ?? 0,
      radius_se: json['radius_se'] ?? 0,
      texture_se: json['texture_se'] ?? 0,
      perimeter_se: json['perimeter_se'] ?? 0,
      area_se: json['area_se'] ?? 0,
      smoothness_se: json['smoothness_se'] ?? 0,
      compactness_se: json['compactness_se'] ?? 0,
      concavity_se: json['concavity_se'] ?? 0,
      concave_points_se: json['concave_points_se'] ?? 0,
      symmetry_se: json['symmetry_se'] ?? 0,
      fractal_dimension_se: json['fractal_dimension_se'] ?? 0,
      radius_worst: json['radius_worst'] ?? 0,
      texture_worst: json['texture_worst'] ?? 0,
      perimeter_worst: json['perimeter_worst'] ?? 0,
      area_worst: json['area_worst'] ?? 0,
      smoothness_worst: json['smoothness_worst'] ?? 0,
      compactness_worst: json['compactness_worst'] ?? 0,
      concavity_worst: json['concavity_worst'] ?? 0,
      concave_points_worst: json['concave_points_worst'] ?? 0,
      symmetry_worst: json['symmetry_worst'] ?? 0,
      fractal_dimension_worst: json['fractal_dimension_worst'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'radiusMean': radiusMean,
      'textureMean': textureMean,
      'perimeterMean': perimeterMean,
      'areaMean': areaMean,
      'smoothnessMean': smoothnessMean,
      'compactnessMean': compactnessMean,
      'concavityMean': concavityMean,
      'concavePointsMean': concavePointsMean,
      'symmetryMean': symmetryMean,
      'fractalDimensionMean': fractalDimensionMean,
      'radius_se': radius_se,
      'texture_se': texture_se,
      'perimeter_se': perimeter_se,
      'area_se': area_se,
      'smoothness_se': smoothness_se,
      'compactness_se': compactness_se,
      'concavity_se': concavity_se,
      'concave_points_se': concave_points_se,
      'symmetry_se': symmetry_se,
      'fractal_dimension_se': fractal_dimension_se,
      'radius_worst': radius_worst,
      'texture_worst': texture_worst,
      'perimeter_worst': perimeter_worst,
      'area_worst': area_worst,
      'smoothness_worst': smoothness_worst,
      'compactness_worst': compactness_worst,
      'concavity_worst': concavity_worst,
      'concave_points_worst': concave_points_worst,
      'symmetry_worst': symmetry_worst,
      'fractal_dimension_worst': fractal_dimension_worst,
    };
  }
}
