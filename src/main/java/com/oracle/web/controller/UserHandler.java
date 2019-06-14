package com.oracle.web.controller;

import java.io.File;


import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.web.bean.User;
import com.oracle.web.service.UserService;
import com.oracle.web.bean.pageBean;


@Controller
@Scope(value = "prototype")
public class  UserHandler{
	
	@Autowired
	private UserService userService;
	
	
//添加用户
	@RequestMapping(value="/add", method=RequestMethod.POST)

	public String add(MultipartFile touxiang,String name,String userName,String password,String phone,String time,HttpSession session ) throws IllegalStateException, IOException {
		String realPath = session.getServletContext().getRealPath("/upload");

		// System.out.println(file.getOriginalFilename());
		// String path ="/upload/"+file.getOriginalFilename();

		int hashCode = touxiang.getOriginalFilename().hashCode();

		String hex = Integer.toHexString(hashCode);

		char c1 = hex.charAt(0);

		char c2 = hex.charAt(1);

		// realPath=realPath+"/"+c1+"/"+c2;

		String redlName = UUID.randomUUID().toString() + "_" + touxiang.getOriginalFilename();

		String savepath = "/" + c1 + "/" + c2 + "/" + redlName;

		File saveFile = new File(realPath + savepath);

		saveFile.mkdirs();

		// 真正上传
		touxiang.transferTo(saveFile);

		String realsavepath = "upload" + savepath;
		
		System.out.println(realsavepath);

		User user = new User(null, name, userName, password, phone, time, realsavepath);

		int i = this.userService.addUser(user);

		session.setAttribute("url",realsavepath);

		if (i > 0) {

			System.out.println("添加成功");
			
			return "redirect:/showUserByPage";
			
			

		} else {
			
			System.out.println("添加失败");

			return "addUser";
		}
	

	}
	
	//验证用户名是否存在
		@RequestMapping(value="/validateUser",method=RequestMethod.GET)
		public String validateUser(String userName,HttpServletResponse response) throws IOException{
			
			System.out.println(userName);
			
			User i = this.userService.validateUser(userName);
		
			
			if(i!=null){
				
				response.getWriter().write("{\"valid\":\"false\"}");//存在
				
			}else{
				
				response.getWriter().write("{\"valid\":\"true\"}");//不存在
			}
			
			return null;
		}

		
	
	
	
//单查 
	@RequestMapping(value= "/updateUser/{id}", method=RequestMethod.GET)
	public String updateUser(@PathVariable(value="id") Integer id,Integer pageNow, HttpSession session) {

		
		//System.out.println("ok");
	User user =this.userService.selectOne(id);
	
		 System.out.println(user);
		 
		 session.setAttribute("user", user);
		 
		return "redirect:/updateUser.jsp";

	}
//删除用户
	@RequestMapping(value = "/user/{ids}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("ids") String ids) {

		this.userService.delete(ids);
		
		System.out.println("ids...");

		return "redirect:/showUserByPage";
	}


	// 修改用户 
	@RequestMapping(value="User",method=RequestMethod.PUT)
	public String updateUser(User user){
		
		this.userService.updateUser(user);
		
		return "redirect:/showUserByPage";
		
	}
	//查看用户
	@RequestMapping(value = "/showUserByPage", method = RequestMethod.GET)
   	public String showByPage(Integer pageNow ,HttpServletRequest request) {
       	
   		if(pageNow ==null || pageNow<0){
   			
   			pageNow=1;
   			
   		}
   		pageBean <User>  pb =userService.showByPage(pageNow); 

   		request.setAttribute("pb", pb);

   		return "showUser";
   	
 }
	//修改头像
		@RequestMapping(value = "/updateTouxiang", method=RequestMethod.POST)
		public String updateTouxiang(Integer id,MultipartFile touxiang, HttpSession session) throws Exception{
			
			System.out.println("修改头像");
			
			String realPath = session.getServletContext().getRealPath("/upload");

			int hashCode = touxiang.getOriginalFilename().hashCode();

			String hex = Integer.toHexString(hashCode);

			char c1 = hex.charAt(0);

			char c2 = hex.charAt(1);

			String redlName = UUID.randomUUID().toString() + "_" + touxiang.getOriginalFilename();

			String savepath = "/" + c1 + "/" + c2 + "/" + redlName;

			File saveFile = new File(realPath + savepath);

			saveFile.mkdirs();

			// 真正上传
			touxiang.transferTo(saveFile);
			
			User user=new User();
			
			String realsavepath = "upload" + savepath;
			
			user.setId(id);
			
			user.setTouxiang(realsavepath);
			
			this.userService.updateTouxiang(user);
			
			return "redirect:/updateUser/"+id;
			
		}
		
		      // 导出
				@RequestMapping(value = "/outPutUser/{ids0}", method = RequestMethod.GET)
				public void
				outPutUser(@PathVariable(value = "ids0") String ids,HttpServletResponse response) throws IOException {
					 
					List<User> list = null;
					String key = "";
					if (ids.equals("all")) {//传入a 表示导出全部
						
						list = this.userService.outPutUserAll();
						key = "全部";

					}else{ 
						//System.out.println(ids1);
						list = this.userService.outPutUserIds(ids);
						key = "勾选";

					}
					//创件一个工作蒲
					HSSFWorkbook Workbook = new HSSFWorkbook();
					
					//创建一个工作表
					HSSFSheet sheet =  Workbook.createSheet(key + "用户信息表");
			          
				    sheet.setColumnWidth(7, 15 * 256); //设定列宽度
				 	//设置样式
					HSSFCellStyle style = Workbook.createCellStyle();
					style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
					HSSFFont font = Workbook.createFont();
					font.setBold(true);
					font.setColor(HSSFColor.DARK_RED.index);
					style.setFont(font);
					String[] title = { "编号", "头像","姓名", "用户名","密码", "手机", "注册时间",  };
					HSSFRow row =   sheet.createRow(0);//从0开始
					for (int i = 0; i < title.length; i++) {
						HSSFCell cell = row.createCell(i);
						cell.setCellStyle(style);
						cell.setCellValue(title[i]);
					}
					HSSFCellStyle style1 = Workbook.createCellStyle();
					style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中
					// 设置字体样式
					for (int i = 0; i < list.size(); i++) { 

						HSSFRow row1 =   sheet.createRow(i + 1);
						User user = list.get(i);

						HSSFCell cell1 = row1.createCell(0);
						cell1.setCellStyle(style1);
						cell1.setCellValue(user.getId());

						HSSFCell cell2 = row1.createCell(1);
						cell2.setCellStyle(style1);
						cell2.setCellValue(user.getTouxiang());
						
						HSSFCell cell3 = row1.createCell(2);
						cell3.setCellStyle(style1);
						cell3.setCellValue(user.getName());

						HSSFCell cell4 = row1.createCell(3);
						cell4.setCellStyle(style1);
						cell4.setCellValue(user.getUserName());

						HSSFCell cell5 = row1.createCell(4);
						cell5.setCellStyle(style1);
						cell5.setCellValue(user.getPassword());

						HSSFCell cell6 = row1.createCell(5);
						cell6.setCellStyle(style1);
						cell6.setCellValue(user.getPhone());

						HSSFCell cell7 = row1.createCell(6);
						cell7.setCellStyle(style1);
						cell7.setCellValue(user.getTime());

					}
					 
					 String fname = key +"用户信息表.xls"; 
					response.setContentType("application/octet-stream");
					response.setHeader("Content-disposition", "attachment;filename="+new String(fname.getBytes("UTF-8"), "iso-8859-1"));
					response.flushBuffer();
					 Workbook.write(response.getOutputStream());


			 
				}
	}


