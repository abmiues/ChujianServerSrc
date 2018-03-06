package com.abmiues.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.abmiues.pojo.Camera;
import com.abmiues.pojo.Food;
import com.abmiues.pojo.Order;
import com.abmiues.pojo.OrderDetail;
import com.abmiues.pojo.Seller;

public interface Sellerdao {//商家数据库接口
	public void register(Seller seller);//商家注册，传入商家信息
	
	public String login(String sellerid);//商家登入，传入商家id
	
	public ArrayList<Food> getMenu(String sellerid);//获取菜单，传入商家id
	
	public int addfood(Food food);//添加食物，传入食物信息
	
	public Seller getSellerInfo(String sellerid);
	
	public void upUserInfo( Seller seller);//更新商家信息，传入商家信息
	
	public void upFoodInfo(Food food);//TODO 更新食物信息
	
	public void upOrderState(Order order);// 商家更新订单信息，传入订单信息
	
	public ArrayList<Order> getOrderBySeller(String sellerid);// 获取订单信息，传入商家id，返回订单列表
	
	public ArrayList<OrderDetail> getOrderDetailByOrderid(int orderid);// 获取订单明细，传入订单id，返回订单明细列表
	
	public void addCamera(Camera camera);
	
	public ArrayList<Camera> getCamera(String sellerid);
	
	public void updateCamera(Camera camera);
	
	public Order getOrderByOrderid(int orderid);
	
}
