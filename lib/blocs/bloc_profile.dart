import 'package:mbom_app/blocs/bloc_base.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc extends BlocBase {
  //region Members
  final String username = "Username";
  //endregion

  //region Controller(s)
  BehaviorSubject<String> _usernameSubject;
  //endregion

  //region Constructor(s)
  ProfileBloc() {
    _usernameSubject = new BehaviorSubject<String>.seeded(username);
  }
  //endregion

  //region Streams, Sinks, Observables
  Observable<String> get usernameObservable => _usernameSubject.stream;
  //endregion

  @override
  void dispose() {
    _usernameSubject.close();
  }
}
