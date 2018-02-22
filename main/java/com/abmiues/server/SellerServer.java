package com.abmiues.server;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.abmiues.dao.Sellerdao;
import com.abmiues.dao.Userdao;
import com.abmiues.pojo.Camera;
import com.abmiues.pojo.Food;
import com.abmiues.pojo.Order;
import com.abmiues.pojo.OrderDetail;
import com.abmiues.pojo.Seller;
import com.abmiues.pojo.User;

@Service("SellerServer")
public class SellerServer {
	@Resource
	private Sellerdao sellerdao;
	public String login(String sellerid,String pwd)
	{
		String resultpwd=sellerdao.login(sellerid);
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
	public Seller getSellerInfo(String sellerid)
	{
		return sellerdao.getSellerInfo(sellerid);
	}
	public void upUserInfo(Seller seller)
	{
		sellerdao.upUserInfo(seller);
	}
	public String addCamera(Camera camera)
	{
		camera.setCameraid(-1);
		sellerdao.addCamera(camera);
		if(camera.getCameraid()!=-1)
		{
			return "111";
		}
		else return "000";
	}
	public ArrayList<Camera> getCamera(String sellerid)
	{
		return sellerdao.getCamera(sellerid);
	}
	public void updateCamera(Camera camera)
	{
		sellerdao.updateCamera(camera);
	}
	public String register(Seller seller)
	{
		String isexit;
		isexit=sellerdao.login(seller.getSellerid());
		if(isexit!=null&&isexit!="")
			return "100";//账号已存在
		else
		{
			sellerdao.register(seller);
			if(seller.getPwd().equals(sellerdao.login(seller.getSellerid())))
			{
				return "111";//注册成功
			}
			else return "000";//注册失败，服务器错误
		}
	}
	public String addfood(Food food) {//添加菜单
		food.setFoodid(-1);
		sellerdao.addfood(food);
		System.out.println(food.getFoodid());
		if(food.getFoodid()!=-1)
		{
			return "111";
		}
		else return "000";
	}
	public ArrayList<Food> getmenu(String sellerid)//获取菜单
	{
		return sellerdao.getMenu(sellerid);
	}
	public ArrayList<Order> getorders(String sellerid)
	{
		return sellerdao.getOrderBySeller(sellerid);
	}
	public ArrayList<OrderDetail> getOrderDetailByOrderid(int orderid){
		return	sellerdao.getOrderDetailByOrderid(orderid);
	}
}
