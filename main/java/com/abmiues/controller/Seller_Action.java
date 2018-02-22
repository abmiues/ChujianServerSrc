package com.abmiues.controller;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.enterprise.inject.New;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abmiues.pojo.Camera;
import com.abmiues.pojo.Food;
import com.abmiues.pojo.Order;
import com.abmiues.pojo.OrderDetail;
import com.abmiues.pojo.Seller;
import com.abmiues.server.SellerServer;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.reflection.wrapper.BaseWrapper;
import org.springframework.stereotype.Controller;

@Controller  
@RequestMapping("seller") 
public class Seller_Action {
	@Resource  
	private SellerServer sellerServer;
	private FileItem getUploadFileItem(List<FileItem> list) {
		for (FileItem fileItem : list) {
			if(!fileItem.isFormField()) {
				return fileItem;
			}
		}
		return null;
	}
	private String getUploadFileName(FileItem item) {
		// 获取路径名
		String value = item.getName();
		// 索引到最后一个反斜杠
		int start = value.lastIndexOf("/");
		// 截取 上传文件的 字符串名字，加1是 去掉反斜杠，
		String filename = value.substring(start + 1);

		return filename;
	}
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
			@RequestParam(value="sellerid",required=true,defaultValue="")String sellerid,
			@RequestParam(value="pwd",required=true,defaultValue="")String pwd,
			@RequestParam(value="tel",required=false,defaultValue="")String tel,
			@RequestParam(value="name",required=false,defaultValue="")String name,
			@RequestParam(value="permintid",required=false,defaultValue="")String permintid,
			HttpServletRequest request
			)
	{
		Seller seller=new Seller();
		seller.setSellerid(sellerid);
		seller.setPwd(pwd);
		seller.setPermitid(permintid);
		seller.setName(name);
		seller.setTel(tel);
		String result=sellerServer.register(seller);
		if(result.equals("111"))
		{
			String webroot=request.getSession().getServletContext().getRealPath("/");
			String path=webroot+"/images/"+sellerid;
			File folder=new File(path);
			if(folder.exists())
				System.out.println("路径存在" + sellerid);
			else
				folder.mkdirs();
			File resimg=new File(webroot+"img"+"/icon.png");
			File targetimg=new File(path+"/icon.png");
			try {
				InputStream in=new FileInputStream(resimg);
				OutputStream out=new FileOutputStream(targetimg);
				byte[] buffer = new byte[1024];  
				int byteread = 0;
	            while ((byteread = in.read(buffer)) != -1) {  
	                out.write(buffer, 0, byteread);  
	            }  
	            if (out != null)  
                    out.close();  
                if (in != null)  
                    in.close();  
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		return result;
		
	}
	//[end]	
	//[start]登陆
	@RequestMapping(value="/login")
	public @ResponseBody
	String login(
			@RequestParam(value="sellerid",required=true,defaultValue="")String sellerid,
			@RequestParam(value="pwd",required=true,defaultValue="")String pwd,HttpServletRequest request)
	{
		request.getSession().setAttribute("sellerid",sellerid);
		request.getSession().setAttribute("pwd", pwd);
		System.out.println("商家登陆:"+sellerid+" "+pwd);
		return sellerServer.login(sellerid,pwd);	
	}
	//[end]
	//[start]自动登陆
	@RequestMapping(value="/autologin",produces = "text/plain;charset=UTF-8")
	public @ResponseBody
	String autologin(HttpServletRequest request)
	{
		return sellerServer.login((String)request.getSession().getAttribute("sellerid"),(String)request.getSession().getAttribute("pwd"));
	}
	//[end]

	@RequestMapping(value="/getuserinfo")
	public @ResponseBody
	Seller getuserinfo(HttpServletRequest request)
	{
		String sellerid=(String) request.getSession().getAttribute("sellerid");
		return sellerServer.getSellerInfo(sellerid);
	}
	
	@RequestMapping(value="/upuserinfo")
	public @ResponseBody
	String upuserinfo(
			@RequestParam(value="tel",required=false,defaultValue="")String tel,
			@RequestParam(value="name",required=false,defaultValue="")String name,
			@RequestParam(value="permintid",required=false,defaultValue="")String permintid,
			HttpServletRequest request)
	{
		String sellerid=(String) request.getSession().getAttribute("sellerid");
		Seller seller=new Seller();
		seller.setSellerid(sellerid);
		seller.setName(name);
		seller.setPermitid(permintid);
		seller.setTel(tel);
		sellerServer.upUserInfo(seller);
		return "111";
	}

	
	@RequestMapping(value="/addcamera")
	public @ResponseBody
	String addcamera(@RequestParam(value="address",required=true,defaultValue="")String address,
			@RequestParam(value="camname",required=true,defaultValue="")String camname,
			HttpServletRequest request)
	{
		String sellerid=(String) request.getSession().getAttribute("sellerid");
		if(sellerid==null||sellerid.equals(""))
		{return "010";}//session过期
		Camera camera=new Camera();
		camera.setAddress(address);
		camera.setSellerid(sellerid);
		camera.setCamname(camname);
		String result=sellerServer.addCamera(camera);
		if(result.equals("111"))
			request.getSession().setAttribute("camera", String.valueOf(camera.getCameraid()));
		return result; 
	}
	
	@RequestMapping(value="/getcamera")
	public @ResponseBody
	ArrayList<Camera> getcamera(HttpServletRequest request)
	{
		String sellerid=(String) request.getSession().getAttribute("sellerid");
		return sellerServer.getCamera(sellerid);
	}
	
	@RequestMapping(value="/updatecamera")
	public @ResponseBody
	String updatecamera(@RequestParam(value="cameraid",required=true,defaultValue="")int cameraid,
			@RequestParam(value="address",required=true,defaultValue="")String address,
			HttpServletRequest request)
	{
		String sellerid=(String) request.getSession().getAttribute("sellerid");
		Camera camera=new Camera();
		camera.setAddress(address);
		camera.setCameraid(cameraid);
		sellerServer.updateCamera(camera);
		return "111";
	}
	

	
	//[start]
	@RequestMapping(value="/addfood")
	public @ResponseBody
	String addfood(@RequestParam(value="name",required=true,defaultValue="")String name,
			@RequestParam(value="price",required=true,defaultValue="")double price,
			@RequestParam(value="des",required=true,defaultValue="")String des,
			@RequestParam(value="url",required=true,defaultValue="")String url,
			HttpServletRequest request)
	{
		String sellerid=(String) request.getSession().getAttribute("sellerid");
		if(sellerid==null||sellerid.equals(""))
		{return "010";}//session过期
		Food food=new Food();
		food.setSellerid(sellerid);
		food.setDes(des);
		food.setName(name);
		food.setPrice(price);
		food.setUrl(url);
		String result=sellerServer.addfood(food);
		if(result.equals("111"))
		{
			System.out.println("foodid:"+food.getFoodid());
			request.getSession().setAttribute("foodid", String.valueOf(food.getFoodid()));
		}
		return result;
	}
	
	
	//[end]
	//[start]
	@RequestMapping(value="/getmenu")
	public @ResponseBody
	ArrayList<Food> getmenu(HttpServletRequest request)
	{
		String sellerid=(String) request.getSession().getAttribute("sellerid");
		if(sellerid==null||sellerid.equals(""))
		{return new ArrayList<Food>();}//session过期
		return sellerServer.getmenu(sellerid);
	}
	//[end]
	
	
	@RequestMapping(value="/getorderlist")
	public @ResponseBody
	ArrayList<Order> getorderlist(HttpServletRequest request)
	{
		
		String sellerid=(String) request.getSession().getAttribute("sellerid");
		System.out.println("获取订单"+sellerid);
		return sellerServer.getorders(sellerid);
	}
	
	@RequestMapping(value="/getorderdetail")
	public @ResponseBody
	ArrayList<OrderDetail> getorderdetail(@RequestParam(value="orderid")int orderid,HttpServletRequest request)
	{
		System.out.println("获取订单明细");
		return sellerServer.getOrderDetailByOrderid(orderid);
	}
	@RequestMapping(value="/updatefilename")
	public @ResponseBody
	String updatefilename(@RequestParam(value="filename",required=true,defaultValue="")String filename,
			HttpServletRequest request)
	{
		request.getSession().setAttribute("filename", filename);
		return "111";
	}
	
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	public @ResponseBody
	String  uploadFile(HttpServletRequest request)
	{
		System.out.println("上传");
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} // 设置编码
		String sellerid= (String) request.getSession().getAttribute("sellerid");
		String foodid=(String)request.getSession().getAttribute("foodid");
		String cameraid=(String)request.getSession().getAttribute("camera");
		String exitname=(String)request.getSession().getAttribute("filename");
		String webroot=request.getSession().getServletContext().getRealPath("/");
		String saveName = "";
		String path=webroot+"/images/"+sellerid;
		if(foodid!=null && !foodid.equals(""))
		{
			saveName=foodid+".png";
			request.getSession().setAttribute("foodid", "");
		}
		else if(cameraid!=null &&!cameraid.equals(""))
		{
			saveName="camera"+cameraid+".png";
			request.getSession().setAttribute("foodid", "");
		}
		else if(exitname!=null&&!exitname.equals(""))
		{
			saveName=exitname;
			request.getSession().setAttribute("filename", "");
		}
		else
		{
			saveName="icon.png";

		}
		File folder=new File(path);
		if(folder.exists())
			System.out.println("路径存在" + sellerid);
		else
			folder.mkdirs();
		// 获得磁盘文件条目工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();

		factory.setRepository(new File(webroot+"/images"));//设置临时存放位置
		// 设置 缓存的大小，当上传文件的容量超过该缓存时，直接放到 暂时存储室
		factory.setSizeThreshold(1024 * 1024);

		// 高水平的API文件上传处理
		ServletFileUpload upload = new ServletFileUpload(factory);

		try {
			// 提交上来的信息都在这个list里面
			// 这意味着可以上传多个文件
			// 请自行组织代码
			List<FileItem> list = upload.parseRequest(request);
			// 获取上传的文件
			FileItem item = getUploadFileItem(list);
			// 获取文件名
			String filename = getUploadFileName(item);
			// 保存后的文件名
			String filetype="";
			if(filename.lastIndexOf(".")==-1)
				filetype="未知类型";
			else 
				filetype=filename.substring(filename.lastIndexOf(".")+1);
			String uploadtime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
			
			// 保存后的浏览器访问路径
			String fileUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+path+"/"+saveName;

			System.out.println("存放目录:" + request.getContextPath()+"/images" );
			System.out.println("文件名:" + filename);
			System.out.println("浏览器访问路径:" + fileUrl);
			// 真正写到磁盘上
			item.write(new File(path, saveName)); // 第三方提供的
			BufferedImage image = ImageIO.read(new File(path, saveName));  
			image = resize(image, 216, 200);  
		     ImageIO.write(image, "png", new File(path, saveName));  
			//[start]获取文件大小
			//[end]


		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("文件上传来自:"+sellerid);
		return "111";
		//return userService.login((String)request.getSession().getAttribute("id"),(String)request.getSession().getAttribute("pwd"));
	}
    private static BufferedImage resize(BufferedImage source, int targetW,  
            int targetH) {  
        int type=source.getType();  
        BufferedImage target=null;  
        double sx=(double)targetW/source.getWidth();  
        double sy=(double)targetH/source.getHeight();  
       /* if(sx>sy)  
        {  
            sx=sy;  
            targetW=(int)(sx*source.getWidth());  
        }else{  
            sy=sx;  
            targetH=(int)(sy*source.getHeight());  
        }  
          */
        if(type==BufferedImage.TYPE_CUSTOM){  
            ColorModel cm=source.getColorModel();  
                WritableRaster raster=cm.createCompatibleWritableRaster(targetW, targetH);  
                boolean alphaPremultiplied=cm.isAlphaPremultiplied();  
                target=new BufferedImage(cm,raster,alphaPremultiplied,null);  
        }else{  
            target=new BufferedImage(targetW, targetH,type);  
        }  
        Graphics2D g=target.createGraphics();  
        g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);  
        g.drawRenderedImage(source, AffineTransform.getScaleInstance(sx, sy));  
        g.dispose();  
        return target;  
    }  

}
