import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:myapp/models/app_state.dart';

const SET_FILTER = 'SET_FILTER';

setFilterAction(String payload) {
  print('---------');
  return { "type": SET_FILTER, payload: payload };
}

ThunkAction<AppState> setFilter(String payload) => (Store<AppState> store) => store.dispatch(setFilterAction(payload));
