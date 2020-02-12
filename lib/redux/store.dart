import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_api_middleware/redux_api_middleware.dart';
import 'package:myapp/logger.dart';
import 'package:myapp/models/app_state.dart';
import 'package:myapp/redux/reducers/app_reducer.dart';

final store = Store<AppState>(
  appReducer,
  initialState: AppState.initial(),
  middleware: [thunkMiddleware, apiMiddleware, loggingMiddleware],
);