String dateChecker(startDate, endDate) {
  String notification;
  print('------');
  print(startDate);
  print(endDate);

  if(startDate != null && endDate != null) {
    if(startDate.isAfter(endDate)) {
      notification = "Start Date Should be Before End Date";
    } else {
      notification = "Displaying movies for date range..";
    }
  } else if (startDate == null && endDate != null) {
    notification = "Select Start Date";
  } else if (startDate != null && endDate == null) {
    notification = "Select End Date";
  } else {
    notification = "Select start & end date";
  }

  return notification;
}