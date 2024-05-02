import 'package:ai_medicare/models/SymptomsModel.dart';
import 'package:ai_medicare/models/diagnosis_model.dart';

abstract class SyptomsStates {}

class initialSyptoms extends SyptomsStates {}

class LoadingSyptoms extends SyptomsStates {}
class LoadingDiagnosis extends SyptomsStates {}

class SuccessSyptoms extends SyptomsStates {
  final SymptomsModel? model;
  SuccessSyptoms(this.model);
}

class FailSyptoms extends SyptomsStates {
  final String error;
  FailSyptoms(this.error);
}


class SuccessGettingDiagnosis extends SyptomsStates{
  final DiagnosisModel diagnosisModel;

  SuccessGettingDiagnosis(this.diagnosisModel);

}

class ErrorGettingDiagnosis extends SyptomsStates{
  final String error;
  ErrorGettingDiagnosis(this.error);
}


