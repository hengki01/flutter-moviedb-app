import 'package:redux_api_middleware/redux_api_middleware.dart';
import 'package:myapp/redux/actions/filter_actions.dart';
import 'package:myapp/models/filter/filter_state.dart';

FilterState filterReducer(FilterState state, FSA action) {
  FilterState newState = state;

  switch (action.type) {  
    case SET_FILTER:
      newState = action.payload;
      return newState;

    default:
      return newState;
  }
}