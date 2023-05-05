String buildGreeting() {
  var dateTime = DateTime.now();
  if (dateTime.hour >= 5 && dateTime.hour < 12) {
    return "Good morning";
  } else if (dateTime.hour >= 12 && dateTime.hour <= 18) {
    return "Good afternoon";
  } else if (dateTime.hour > 18 && dateTime.hour <= 22) {
    return "Good evening";
  } else {
    return "Good night";
  }
}
