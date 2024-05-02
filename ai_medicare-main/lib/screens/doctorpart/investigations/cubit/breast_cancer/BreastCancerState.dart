abstract class BreastCancerState{}

class InitialBreastCancerState extends BreastCancerState{}

class LoadingBreastCancerState extends BreastCancerState{}


class SuccessLoadedBreastCancerState extends BreastCancerState{
  final String value;
  SuccessLoadedBreastCancerState(this.value);
}

class FailedLoadingBreastCancerState extends BreastCancerState{
  final String errorMessage;
  FailedLoadingBreastCancerState(this.errorMessage);
}