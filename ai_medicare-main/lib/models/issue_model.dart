class IssueModel{
  final String status;
  final IssueData issue;

  IssueModel({required this.status, required this.issue});

  factory IssueModel.fromJson(Map json){
    return IssueModel(
      status: json['status'] as String,
      issue: IssueData.fromJson(json['issue']),
    );
  }
}


class IssueData{
  final String description;
  final String descriptionShort;
  final String medicalCondition;
  final String name;
  final String possibleSymptoms;
  final String profName;
  final String synonyms;
  final String treatmentDescription;

  IssueData({required this.description, required this.descriptionShort, required this.medicalCondition, required this.name, required this.possibleSymptoms, required this.profName, required this.synonyms, required this.treatmentDescription});


  factory IssueData.fromJson(Map json){
    return IssueData(
      description: json['Description'] as String,
      descriptionShort: json['DescriptionShort'] as String,
      medicalCondition: json['MedicalCondition'] as String,
      name: json['Name'] as String,
      possibleSymptoms: json['PossibleSymptoms'] as String,
      profName: json['ProfName'] as String,
      synonyms: json['Synonyms'] as String,
      treatmentDescription: json['TreatmentDescription'] as String
    );
  }
}