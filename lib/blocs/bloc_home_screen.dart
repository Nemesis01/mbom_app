import 'package:mbom_app/blocs/bloc_base.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreenBloc extends BlocBase {
  final PublishSubject _linkController = new PublishSubject();

  ///
  /// Releases the resources, precisely StreamControllers
  ///
  @override
  void dispose() {
    _linkController.close();
  }
}
