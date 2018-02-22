package com.abmiues.dao;

import java.util.ArrayList;

import com.abmiues.pojo.F_comment;
import com.abmiues.pojo.S_comment;

public interface Commondao {//公用数据库接口
	
	public ArrayList<F_comment> getfoodcomment(int foodid);//获取食物评价，传入食品id，返回评价列表
	
	public ArrayList<S_comment> getsellercomment(String sellerid);//获取商店评价，传入食品商家id，返回评价列表
	
	public void addfoodcomment(F_comment f_comment);// 添加食品评价，传入评价信息
	
	public void addsellercomment(S_comment s_comment);// 添加商家评价，传入商家评价
	
}
