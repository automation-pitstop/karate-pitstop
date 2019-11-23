package com.automation.pitstop.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BaseUtils {
	public static String appendTimeStamp(String textToAppend) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		return textToAppend + " " + sdf.format(time);
	}

}
