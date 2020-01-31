import 'package:mbom_app/blocs/bloc_base.dart';

class PreferencesBloc implements BlocBase {
  //region Members
  // Try to find a way to get it from SharedPreferences or Online
  Map<String, dynamic> _preferences = {
    "night mode": false,
    "use biometrics": true,
  };

  Map<String, dynamic> _privileges = {
    "account type": "free",
  };

  Map<String, dynamic> _userInfos = {};
  //endregion

  //region Subjects, Streams

  //endregion

  //region Constructor(s)

  //endregion

  //region Observables,

  //endregion

  @override
  void dispose() {}
}
