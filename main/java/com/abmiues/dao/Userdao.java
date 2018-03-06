package com.abmiues.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.abmiues.pojo.Camera;
import com.abmiues.pojo.Food;
import com.abmiues.pojo.Order;
import com.abmiues.pojo.OrderDetail;
import com.abmiues.pojo.Seller;
import com.abmiues.pojo.User;

public interface Userdao {//用户数据库接口
	public void register(User user);//用户注册，传入用户信息
	
	public String login(String userid);//用户登录，传入用户id，返回密码的MD5码
	
	public User getUserInfo(String userid);//获取用户信息，传入用户id，返回用户信息
	
	public ArrayList<Food> getMenu(String sellerid);//获取商家菜单，传入商家id，返回食品列表
	
	public ArrayList<Seller> getSeller();//获取商家，返回商家列表
	
	public ArrayList<Camera> getCamera();//获取直播摄像头信息，返回摄像头列表
	
	public ArrayList<Camera> searchCamera(String name);//查找直播，传入查找内容，返回摄像头信息列表，
	
	public ArrayList<Seller> searchSeller(String name);//查找商家，传入查找内容，返回商家列表
	
	public ArrayList<Order> getOrderByUserid(String userid);//获取订单信息，传入用户id，返回订单列表
	
	public ArrayList<OrderDetail> getOrderDetailByOrderid(int orderid);//获取订单明细，传入订单id，返回订单明细列表
	
	public int addOrderDetail(OrderDetail orderdetail);//添加订单详细，传入订单详细信息，返回插入结果的标记信息
	
	public void addOrder(Order order);//添加订单，传入订单信息
	
	public Seller getSellerById(String sellerid);//获取商家，传入商家id，返回商家信息
	
	public void updateOrder(HashMap<String, Object> map);//更新订单信息，传入订单id，订单金额
	
	public void updateUserInfo(User user);//TODO 更新用户信息，传入用户信息
	
	public void upOrderState(Order order);// 更新订单状态，传入订单信息
	
	public Order getOrderByOrderid(int orderid);//根据订单id获取订单信息
	
}
