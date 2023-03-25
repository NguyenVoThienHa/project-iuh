package other;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class XuLyNgay {

	public static String chuyenDateThanhString(Date date) {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");

		String ngayThang;

		if (date != null) {
			ngayThang = simpleDateFormat.format(date);
		} else {
			ngayThang = "";
		}
		return ngayThang;

	}

	public static Date chuyenStringThanhDate(String ngayThang) {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");

		java.util.Date date = null;
		try {
			date = simpleDateFormat.parse(ngayThang);
			@SuppressWarnings("deprecation")
			Date source = new Date(date.getYear(), date.getMonth(), date.getDate());

			return source;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}
	public static int soNgay (java.util.Date date,Date ngaytra) {
		long difference = ngaytra.getTime() - date.getTime();
		int daysBetween = (int) (difference / (1000*60*60*24));
    	daysBetween+=1;
	    return daysBetween;
	}
}
