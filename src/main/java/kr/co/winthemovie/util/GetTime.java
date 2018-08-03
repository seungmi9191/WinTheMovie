package kr.co.winthemovie.util;

import java.util.Calendar;

public class GetTime {

	public static String today() {
		Calendar cal = Calendar.getInstance();

		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH) + 1;
		int date = cal.get(cal.DATE) - 1;

		String str_year = String.valueOf(year);
		String str_month = null;
		String str_date = null;

		if (month < 10)
			str_month = "0" + String.valueOf(month);
		else
			str_month = String.valueOf(month);

		if (date < 10)
			str_date = "0" + String.valueOf(date);
		else
			str_date = String.valueOf(date);

		return str_year + str_month + str_date;
	}
}
