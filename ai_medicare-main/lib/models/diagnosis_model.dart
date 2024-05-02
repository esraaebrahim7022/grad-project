class DiagnosisModel {
  final String status;
  final int results;
  final List<Diagnosis> diagnosis;

  DiagnosisModel(
      {required this.status, required this.results, required this.diagnosis});

  factory DiagnosisModel.fromJson(Map json) {
    print(json);
    return DiagnosisModel(
      status: json['status'] as String,
      results: json['results'] as int,
      diagnosis: (json['diagnosis'] as List<dynamic>)
          .map((diagnosisJson) => Diagnosis.fromJson(diagnosisJson))
          .toList(),
    );
  }
}

class Diagnosis {
  final Issue issue;
  final List<Specialisation> specialisation;

  Diagnosis({required this.issue, required this.specialisation});

  Map<String, dynamic> toJson() => {
        'issue': issue.toJson(),
        'specialisation': specialisation.map((spec) => spec.toJson()).toList(),
      };

  factory Diagnosis.fromJson(Map json) => Diagnosis(
        issue: Issue.fromJson(json['Issue']),
        specialisation: (json['Specialisation'] as List<dynamic>)
            .map((specJson) => Specialisation.fromJson(specJson))
            .toList(),
      );
}

class Specialisation {
  final int id;
  final String name;
  final int specialistId;

  Specialisation(
      {required this.id, required this.name, required this.specialistId});

  Map<String, dynamic> toJson() => {
        'ID': id,
        'Name': name,
        'SpecialistID': specialistId,
      };

  factory Specialisation.fromJson(Map json) => Specialisation(
        id: json['ID'] as int,
        name: json['Name'] as String,
        specialistId: json['SpecialistID'] as int,
      );
}

class Issue {
  final int id;
  final String name;
  final double accuracy;
  final String icd;
  final String icdName;
  final String profName;
  final int ranking;

  Issue(
      {required this.id,
      required this.name,
      required this.accuracy,
      required this.icd,
      required this.icdName,
      required this.profName,
      required this.ranking});

  Map<String, dynamic> toJson() => {
        'ID': id,
        'Name': name,
        'Accuracy': accuracy,
        'Icd': icd,
        'IcdName': icdName,
        'ProfName': profName,
        'Ranking': ranking,
      };

  factory Issue.fromJson(Map<String, dynamic> json) => Issue(
        id: json['ID'] as int,
        name: json['Name'] as String,
        accuracy: json['Accuracy'] as double,
        icd: json['Icd'] as String,
        icdName: json['IcdName'] as String,
        profName: json['ProfName'] as String,
        ranking: json['Ranking'] as int,
      );
}
