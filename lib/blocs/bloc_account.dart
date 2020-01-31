import 'package:mbom_app/blocs/bloc_base.dart';
import 'package:rxdart/rxdart.dart';

class AccountBloc extends BlocBase {
  //region Members
  List<String> _managementOptions = [
    'My Addresses',
    'My Orders',
    'My Wallet',
  ];

  // TODO: Implement Scope Model to get user's Data
  List<String> _userData = [
    'Calamity Jane',
    'calamity.jane@western.us',
    'password',
  ];

  Map<String, int> _dashboardItems = {
    "lists": 0,
    "favorites": 0,
    "cart": 0,
    // "friends": 0,
  };

  List<String> _appSettings = [
    "preferences",
    "language",
    "share",
    "rate us",
  ];

  List<String> _appHelp = [
    "help center",
    "questions",
  ];

  List<String> _accountGlobalSettings = [
    "disconnect",
    "delete account",
  ];

  //endregion

  //region Controllers, Subjects
  BehaviorSubject<List<String>> _managementOptionsSubject;
  BehaviorSubject<List<String>> _dataSubject;
  BehaviorSubject<Map<String, int>> _dashboardSubject;
  BehaviorSubject<List<String>> _appSettingsSubject;
  BehaviorSubject<List<String>> _globalSettingsSubject;
  //endregion

  //region Constructor
  AccountBloc() {
    _managementOptionsSubject =
        new BehaviorSubject<List<String>>.seeded(_managementOptions);
    _dataSubject = new BehaviorSubject<List<String>>.seeded(_userData);

    _dashboardSubject =
        new BehaviorSubject<Map<String, int>>.seeded(_dashboardItems);
    _appSettingsSubject =
        new BehaviorSubject<List<String>>.seeded(_appSettings);
    _globalSettingsSubject =
        new BehaviorSubject<List<String>>.seeded(_accountGlobalSettings);
  }
  //endregion

  //region Streams, Sinks, Observables (Getters)
  Observable<List<String>> get optionsObservable =>
      _managementOptionsSubject.stream;
  Observable<List<String>> get userdataObservable => _dataSubject.stream;
  Observable<Map<String, int>> get dashboardItems => _dashboardSubject.stream;
  Observable<List<String>> get appSettings => _appSettingsSubject.stream;
  Observable<List<String>> get globalSettings => _globalSettingsSubject.stream;
  //endregion

  @override
  void dispose() {
    _dashboardSubject.close();
    _appSettingsSubject.close();
    _managementOptionsSubject.close();
    _dataSubject.close();
    _globalSettingsSubject.close();
  }
}
