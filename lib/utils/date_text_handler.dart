String dateTextHandler(type, date) {
  String dateText;

  if(date != null) {
    dateText = date.toLocal().split(' ')[0];
  } else if( type == 'startDate') {
    dateText = 'Start Date';
  } else if( type == 'endDate') {
    dateText = 'End Date';
  } 

  return dateText;
}