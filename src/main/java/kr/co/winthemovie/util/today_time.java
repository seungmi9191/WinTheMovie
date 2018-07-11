package kr.co.winthemovie.util;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

// 오늘 날짜 구하는 클래스
// 형태 : yyyymmdd
public class today_time {

	public static String today() {

		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.add(Calendar.DATE, -1);
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		String s_year = String.valueOf(year);
		String s_month = null;
		String s_day = null;

		if (month < 10) {
			s_month = "0" + String.valueOf(month);
		}else {
			s_month = String.valueOf(month);
		}
		if (day < 10) {
			s_day = "0" + String.valueOf(day);
		}else {
			s_day = String.valueOf(day);
		}
		
		return s_year + s_month + s_day;
	}
}
