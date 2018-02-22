package com.abmiues.controller;

import java.net.HttpURLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;  

import javax.annotation.Resource;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject; 
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abmiues.dao.Userdao;
import com.abmiues.pojo.Camera;
import com.abmiues.pojo.F_comment;
import com.abmiues.pojo.Food;
import com.abmiues.pojo.Order;
import com.abmiues.pojo.OrderDetail;
import com.abmiues.pojo.S_comment;
import com.abmiues.pojo.Seller;
import com.abmiues.pojo.User;
import com.abmiues.server.UserServer;


import org.springframework.stereotype.Controller;

@Controller  
@RequestMapping("user") 
public class User_Action {
	@Resource  
	private UserServer userServer;
//@RequestMapping(value = "/hello", produces = "text/plain;charset=UTF-8")中produces和mvc中设置编码功能一样，在mvc中设置了，此处可不设置
	@RequestMapping(value = "/hello", produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String hello() {
		return "你好！hello";
	}
	//[start]注册
	@RequestMapping(value="/register")
	public @ResponseBody
	String register(
			@RequestParam(value="userid",required=true,defaultValue="")String userid,
			@RequestParam(value="pwd",required=true,defaultValue="")String pwd,
			@RequestParam(value="tel",required=false,defaultValue="")String tel,
			@RequestParam(value="name",required=false,defaultValue="")String name
			)
	{
		System.out.println(name);
		User user=new User();
		user.setName(name);
		user.setPwd(pwd);
		user.setTel(tel);
		user.setUserid(userid);
		return userServer.register(user);

	}
	
	@RequestMapping(value="/getcheckcode")
	public @ResponseBody
	String getcheckcode(
			@RequestParam(value="phone",required=true,defaultValue="")String phone,HttpServletRequest request)
	{
		request.getSession().setAttribute("checkcode", "1111");
		System.out.println("短信:"+phone);
		return "000";
		//return userServer.templateSMS("396a86385cf1051d848a40dbcb91e141", "fb1bdb2ecc03d51996a702a014414722", "e6dd591a943b40acb1ce674af4030545", "36831", phone, "4545,3");
	}
	
	//[end]	
	//[start]登陆
	@RequestMapping(value="/login")
	public @ResponseBody
	String login(
			@RequestParam(value="userid",required=true,defaultValue="")String userid,
			@RequestParam(value="pwd",required=true,defaultValue="")String pwd,HttpServletRequest request)
	{
		request.getSession().setAttribute("userid",userid);
		request.getSession().setAttribute("pwd", pwd);
		System.out.println("登陆:"+userid);
		return userServer.login(userid,pwd);	
	}
	//[end]
	//[start]自动登陆]
	@RequestMapping(value="/autologin",method=RequestMethod.POST,produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String autologin(HttpServletRequest request)
	{
		System.out.println(request.getSession().getId());
		System.out.println("自动登陆:"+(String)request.getSession().getAttribute("userid"));
		return userServer.login((String)request.getSession().getAttribute("userid"),(String)request.getSession().getAttribute("pwd"));
	}
	//[end]


	//[start]
	@RequestMapping(value="/getseller")
	public @ResponseBody
	ArrayList<Seller> stu_getclasses(HttpServletRequest request)
	{
		String userid=(String) request.getSession().getAttribute("userid");	
		System.out.println("获取商家");
		return userServer.getseller();
	}
	@RequestMapping(value="/getsellerbyid")
	public @ResponseBody
	Seller getsellerbyid(@RequestParam(value="sellerid")String sellerid,HttpServletRequest request)
	{
		System.out.println("获取商家:"+sellerid);
		return userServer.getSellerById(sellerid);
	}
	//[end]
	
	@RequestMapping(value="/addfoodcomment")
	public @ResponseBody
	void addfoodcomment(
			@RequestParam(value="content")String content,
			@RequestParam(value="foodid")int foodid,
			@RequestParam(value="score")int score,
			HttpServletRequest request)
	{
		System.out.println("食品评价"+foodid);
		String userid=(String) request.getSession().getAttribute("userid");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time=df.format(new Date());
		String username=userServer.getUserInfo(userid).getName();
		F_comment f_comment=new F_comment();
		f_comment.setContent(content);
		f_comment.setFoodid(foodid);
		f_comment.setScore(score);
		f_comment.setTime(time);
		f_comment.setUsername(username);
		f_comment.setUserid(userid);
		userServer.addfoodcomment(f_comment);
	}
	
	@RequestMapping(value="/addsellercomment")
	public @ResponseBody
	void addsellercomment(@RequestParam(value="sellerid")String sellerid,
			@RequestParam(value="content")String content,
			@RequestParam(value="score")int score,HttpServletRequest request)
	{
		
		System.out.println("商家评价"+sellerid);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time=df.format(new Date());
		String userid=(String) request.getSession().getAttribute("userid");
		String username=userServer.getUserInfo(userid).getName();
		S_comment s_comment=new S_comment();
		s_comment.setContent(content);
		s_comment.setScore(score);
		s_comment.setSellerid(sellerid);
		s_comment.setTime(time);
		s_comment.setUsername(username);
		s_comment.setUserid(userid);
		userServer.addsellercomment(s_comment);
	}
	//[start]
	@RequestMapping(value="/getmenu")
	public @ResponseBody
	ArrayList<Food> getmenu(@RequestParam(value="sellerid")String sellerid,HttpServletRequest request)
	{
		System.out.println("获取菜单"+sellerid);
		return userServer.getmenu(sellerid);
	}
	
	@RequestMapping(value="/getfoodcomment")
	public @ResponseBody
	ArrayList<F_comment> getfoodcomment(@RequestParam(value="foodid")int foodid,HttpServletRequest request)
	{
		return userServer.getfoodcomment(foodid);
	}
	
	@RequestMapping(value="/getsellercomment")
	public @ResponseBody
	ArrayList<S_comment> getsellercomment(@RequestParam(value="sellerid")String sellerid,HttpServletRequest request)
	{
		return userServer.getsellercomment(sellerid);
	}
	
	@RequestMapping(value="/getcamera")
	public @ResponseBody
	ArrayList<Camera> getcamera(HttpServletRequest request)
	{
		return userServer.getCamera();
	}
	@RequestMapping(value="/searchcamera")
	public @ResponseBody
	ArrayList<Camera> searchCamera(@RequestParam(value="name")String name,HttpServletRequest request)
	{
		return userServer.searchCamera(name);
	}
	@RequestMapping(value="/searchseller")
	public @ResponseBody
	ArrayList<Seller> searchSeller(@RequestParam(value="name")String name,HttpServletRequest request)
	{
		return userServer.searchSeller(name);
	}
	@RequestMapping(value="/addorder")
	public @ResponseBody
	int addorder(@RequestParam(value="data")String data,HttpServletRequest request)
	{
		System.out.println(data);
		System.out.println("添加订单");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time=df.format(new Date());
		String userid=(String)request.getSession().getAttribute("userid");
		if(userid!=null && !userid.equals(""))
		{
			JSONObject carbyseller = null;
			JSONObject carItems;
			try {
				if(data.equals(""))
					carbyseller=new JSONObject();
				else
					carbyseller=new JSONObject(data);//读取购物车json字符串，放这里是因为这里有try,省得多写一个try
			} catch (JSONException e) {
			}
			Iterator sellers=carbyseller.keys();
			while (sellers.hasNext())
			{
				double priceInSeller=0;
				String sellerid= (String) sellers.next();
				String sellername=userServer.getSellerById(sellerid).getName();
				Order order=new Order();
				order.setAddress("");
				order.setArrtime("尽快到达");
				order.setPrice(0);
				order.setRemark("");
				order.setTime(time);
				order.setUserid(userid);
				order.setSellername(sellername);
				order.setSellerid(sellerid);
				int orderid=userServer.addOrder(order);//插入订单，获取订单id
				try {
					carItems=carbyseller.getJSONObject(sellerid);//读取本商店购物车
				} catch (JSONException e) {
					carItems=new JSONObject();
				}
				Iterator it=carItems.keys();//开始遍历json
				while (it.hasNext())
				{
					String key= (String) it.next();
					JSONObject cariteminfo= null;
					try {
						cariteminfo = carItems.getJSONObject(key);
						double price=cariteminfo.getDouble("price");
						int num=cariteminfo.getInt("num");
						if(num>0)
						{
							OrderDetail orderDetail=new OrderDetail();
							orderDetail.setFoodname(cariteminfo.getString("name"));
							orderDetail.setNum(num);
							orderDetail.setOrderid(orderid);
							orderDetail.setPrice(price);
							orderDetail.setRemark("");
							orderDetail.setSellername(sellername);
							orderDetail.setFoodid(Integer.valueOf(key));
							userServer.addOrderDetail(orderDetail);
							priceInSeller+=num*price;
						}
						//userServer.addallorder(sellerid,userid,cariteminfo.getString("name"),cariteminfo.getInt("foodid"),num,price);
					} catch (JSONException e) {
						e.printStackTrace();
					}
				}
				HashMap<String, Object> map=new HashMap<String, Object>();
				System.out.println(priceInSeller);
				System.out.println(orderid);
				map.put("price", priceInSeller);
				map.put("orderid", orderid);
				userServer.updateOrder(map);
			}
			return 1;
		}
		else
			return -3;//session过期

	}
	
	@RequestMapping(value="/getorderlist")
	public @ResponseBody
	ArrayList<Order> getorderlist(HttpServletRequest request)
	{
		
		String userid=(String) request.getSession().getAttribute("userid");
		System.out.println("获取订单"+userid);
		return userServer.getOrderByUserid(userid);
	}
	
	@RequestMapping(value="/getorderdetail")
	public @ResponseBody
	ArrayList<OrderDetail> getorderdetail(@RequestParam(value="orderid")int orderid,HttpServletRequest request)
	{
		System.out.println("获取订单明细");
		return userServer.getOrderDetailByOrderid(orderid);
	}
	//[end]

}
