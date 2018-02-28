package com.abmiues.server;

import java.io.IOException;

import javax.json.JsonObject;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Service;

import com.abmiues.Push.ServerSocket;


@Service("CommonServer")
public class CommonServer {
	
	
	/**
	 * 推送数据给用户
	 * @param func 方法名，用户客户端辨识
	 * @param obj 数据内容
	 * @param sellerid 用户id
	 */
	public static void PushToUser(String func,Object obj,String uid)
	{
		String pushstr;
		try {
			pushstr = "{\"func\":\""+func+"\",\"data\":\""+new ObjectMapper().writeValueAsString(obj)+"\"}";
			ServerSocket.Instance().push(pushstr, uid+"_u");
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 推送数据给商家
	 * @param func 方法名，用户客户端辨识
	 * @param obj 数据内容
	 * @param sellerid 商家id
	 */
	public static void PushToSeller(String func,Object obj,String sellerid)
	{
		String pushstr;
		try {
			pushstr = "{\"func\":\""+func+"\",\"data\":\""+new ObjectMapper().writeValueAsString(obj)+"\"}";
			ServerSocket.Instance().push(pushstr, sellerid+"_s");
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

}
