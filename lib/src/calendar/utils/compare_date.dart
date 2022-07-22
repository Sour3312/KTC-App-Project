bool compareDate(DateTime dateTimeA, DateTime dateTimeB) {
  return ((dateTimeA.year == dateTimeB.year) &&
      (dateTimeA.month == dateTimeB.month) &&
      (dateTimeA.day == dateTimeB.day));
}
