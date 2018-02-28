package com.abmiues.server;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.jar.Attributes.Name;

import javax.annotation.Resource;
import javax.print.DocFlavor.STRING;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.abmiues.Push.ServerSocket;
import com.abmiues.dao.Commondao;
import com.abmiues.dao.Userdao;
import com.abmiues.pojo.Camera;
import com.abmiues.pojo.F_comment;
import com.abmiues.pojo.Food;
import com.abmiues.pojo.MD5;
import com.abmiues.pojo.Order;
import com.abmiues.pojo.OrderDetail;
import com.abmiues.pojo.S_comment;
import com.abmiues.pojo.Seller;
import com.abmiues.pojo.User;

@Service("UserServer")
public class UserServer {
	@Resource
	private Userdao userdao;
	@Resource
	private Commondao commondao;
	public String login(String userid,String pwd)
	{
		String resultpwd=userdao.login(userid);
		if(resultpwd==null||resultpwd.equals(""))
		{
			return "100";
		}
		else
		{
			if(resultpwd.equals(pwd))
			{
				return "111";//登录成功
			}
			else
			{
				return "000";//密码错误
			}
		}
	}
	public User getUserInfo(String userid)
	{
		return userdao.getUserInfo(userid);
	}
	public String register(User user)
	{
		String isexit;
		isexit=userdao.login(user.getUserid());
		if(isexit!=null&&isexit!="")
			return "100";//账号已存在
		else
		{
			userdao.register(user);
			if(user.getPwd().equals(userdao.login(user.getUserid())))
				return "111";//注册成功
			else return "000";//注册失败，服务器错误
		}
	}
	public ArrayList<Seller> getseller() {
		return userdao.getSeller();
	}
	public ArrayList<Food> getmenu(String sellerid)
	{
		return userdao.getMenu(sellerid);
	}
	public ArrayList<S_comment> getsellercomment(String sellerid)
	{
		return commondao.getsellercomment(sellerid);
	}
	public ArrayList<F_comment> getfoodcomment(int foodid)
	{
		return commondao.getfoodcomment(foodid);
	}
	public ArrayList<Camera> getCamera()
	{
		return userdao.getCamera();
	}
	public ArrayList<Camera> searchCamera(String name)
	{
		return userdao.searchCamera(name);
	}
	public ArrayList<Seller> searchSeller(String name) {
		return userdao.searchSeller(name);
	}
	public int addOrderDetail(OrderDetail orderdetail){
		return userdao.addOrderDetail(orderdetail);
	}

	public int addOrder(Order order){
		 userdao.addOrder(order);
		 return order.getOrderid();
	}

	public Seller getSellerById(String sellerid)
	{
		return userdao.getSellerById(sellerid);	
	}
	
	
	public ArrayList<Order> getOrderByUserid(String userid){
		return userdao.getOrderByUserid(userid);
	}

	public ArrayList<OrderDetail> getOrderDetailByOrderid(int orderid){
		return	userdao.getOrderDetailByOrderid(orderid);
	}
	
	public void updateOrder(HashMap<String, Object> map)
	{
		userdao.updateOrder(map);
	}
	
	public void addfoodcomment(F_comment f_comment)
	{
		commondao.addfoodcomment(f_comment);
	}
	
	public void addsellercomment(S_comment s_comment)
	{
		commondao.addsellercomment(s_comment);
	}
	
	public int setCheckcode(String phone)
	{
		return 0;
	}
	
	
	//这里本来是为了做网络短信的，结果测试失败了，就放在不用了
	public String templateSMS(String accountSid, String authToken,
			String appId, String templateId, String to, String param) {
		// TODO Auto-generated method stub
		String result = "";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String timestamp = formatter.format(new Date());
		String Authorization=MD5.GetMD5Code(accountSid+":"+timestamp);
		String signature=MD5.GetMD5Code(accountSid+authToken+timestamp);
		System.out.println(timestamp);
		System.out.println(Authorization);
		System.out.println(signature);
		String urlstr = "https://api.ucpaas.com/2014-06-30/Accounts/"+accountSid+"/Messages/templateSMS?sig="+signature;
		URL url;
		try {
			url = new URL(urlstr);
			 HttpURLConnection httpConn=(HttpURLConnection)url.openConnection();
		        //设置参数
		        httpConn.setDoOutput(true);   //需要输出
		        httpConn.setDoInput(true);   //需要输入
		        httpConn.setUseCaches(false);  //不允许缓存
		        httpConn.setRequestMethod("POST");   //设置POST方式连接
		        httpConn.setInstanceFollowRedirects(false);
		        httpConn.setRequestProperty("Accept","application/json");
		        httpConn.setRequestProperty("Content-Type", "application/json;charset=utf-8");
		        httpConn.setRequestProperty("Charset", "UTF-8");
		        httpConn.setRequestProperty("Authorization", Authorization);
					//MD5加密
		        httpConn.connect();
		        //建立输入流，向指向的URL传入参数
		        DataOutputStream dos=new DataOutputStream(httpConn.getOutputStream());
		        param="appId="+appId+"&templateId="+templateId+"&to="+to+"&param="+param;
		        dos.write(param.getBytes());
		        dos.flush();
		        dos.close();
		        int resultCode=httpConn.getResponseCode();
	            if(HttpURLConnection.HTTP_OK==resultCode) {
	                StringBuffer sb= new StringBuffer();
	                String readLine = new String();
	                BufferedReader responseReader = new BufferedReader(new InputStreamReader(httpConn.getInputStream(), "UTF-8"));
	                while ((readLine = responseReader.readLine()) != null) {
	                    sb.append(readLine);
	                }
	                responseReader.close();
	                result=sb.toString();

	            }
	            else
	            	System.out.println(param);
	            	System.out.println(resultCode);
	            	System.out.println(HttpURLConnection.HTTP_OK);
		} catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
		return result;
	}

}
