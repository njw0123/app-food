package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.fcst.FcstItem;
import data.fcst.FcstResponse;
import util.FcstAPI;

@WebServlet("/index")
public class IndexController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		String date = simpleDateFormat.format(System.currentTimeMillis());
		simpleDateFormat = new SimpleDateFormat("HH00");
		String time = simpleDateFormat.format(System.currentTimeMillis());
		time = Integer.parseInt(time) - 100 + "";
		FcstResponse fcstResponse = FcstAPI.getSFcsts(date, time);
		FcstItem[] fcstItem = fcstResponse.getBody().getItems().getItem();
		List<String> list = new ArrayList<>();
		for (FcstItem i : fcstItem) {
			if (i.getCategory().equals("T1H")) {
				list.add(list.get(0) + " " + i.getFcstValue() + "도");
				list.remove(0);
			}
			if (i.getCategory().equals("SKY")) {
				if (i.getFcstValue().equals("1")) {
					list.add(i.getFcstTime().substring(0, 2) + ":" + "00 맑음");
				} else if (i.getFcstValue().equals("3")) {
					list.add(i.getFcstTime().substring(0, 2) + ":" + "00 구름많음");
				} else if (i.getFcstValue().equals("4")) {
					list.add(i.getFcstTime().substring(0, 2) + ":" + "00 흐림");
				}
			}
		}
		req.setAttribute("list", list);

		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
	}
}
