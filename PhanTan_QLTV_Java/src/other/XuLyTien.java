package other;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;

public class XuLyTien {
 public static String  nhanThanhTien(String songay,String giaphong ) {
	 BigDecimal sn=new BigDecimal(songay);
	 BigDecimal gia=new BigDecimal(giaphong);
	 return String.valueOf(sn.multiply(gia));
 }
 public static BigDecimal tongThanhTien(BigDecimal t1,BigDecimal t2 ) {
	 return t1.add(t2);
 }
 public static String convert(String mn) {
	 return String.valueOf(new BigDecimal(mn));
 }
 public static String formatVND(String mn) {
		BigDecimal n=new BigDecimal(mn);
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		return formatter.format(n)+" VNĐ";
 	}
 
 public static void main(String[] args) {
	 String scientificNotation = "3.23E+7";
		Double scientificDouble = Double.parseDouble(scientificNotation);
		NumberFormat nf = new DecimalFormat("################################################.###########################################");
		String decimalString = nf.format(scientificDouble);
		System.out.println(decimalString);
}
}
