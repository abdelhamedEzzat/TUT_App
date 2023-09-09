abstract class BaseViewModel extends BaseViewModelInputs
    implements BaseViewModelOutputs {
//shared function and variabels that will be througt and view model
}

abstract class BaseViewModelInputs {
  void start(); // start view model job

  void despose(); // will be called when view model died
}

abstract class BaseViewModelOutputs {
  // will be implemented later
}
