import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

class SimpleBlocObserver extends BlocObserver {
  final Logger logger = Logger();

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.i('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.i('${bloc.runtimeType} $transition');
  }
}
