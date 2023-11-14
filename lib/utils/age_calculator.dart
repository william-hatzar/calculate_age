class AgeCalculator {

  Map<String, int> calculateAge(DateTime birthdate) {
    // Calculate age
    DateTime now = DateTime.now();
    int years = now.year - birthdate.year;
    int months = now.month - birthdate.month;
    int days = now.day - birthdate.day;

    // Adjust for negative values in months or days
    if (days < 0) {
      months--;
      days += DateTime(now.year, now.month - 1, now.day).difference(now).inDays;
    }
    if (months < 0) {
      years--;
      months += 12;
    }

    // Return the result as a map
    return {'years': years, 'months': months, 'days': days};
  }

}

