package com.oracle.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.web.bean.User;
import com.oracle.web.service.BookService;
import com.oracle.web.service.UserService;
import com.oracle.web.bean.Book;
import com.oracle.web.bean.PageBean;

@Controller
@Scope(value = "prototype")
public class UserHandler {
	private static final String NONE = null;
	@Autowired
	private UserService userService;
	
	
	// 1.添加用户
	@RequestMapping(value = "/add", method = RequestMethod.GET)

	public String add(User user) {

		userService.save(user);

		return "redirect:/users";

	}

	// 2.修改用户
	@RequestMapping(value = "/user", method = RequestMethod.PUT)
	public String update(User user) {

		userService.update(user);
		System.out.println(user);
		return "redirect:/users";

	}

	// 3.删除用户
	@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") Integer id1) {

		User u = new User();

		u.setId(id1);

		userService.delete(u);

		return "redirect:/users";
	}

	// 4.单查
	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("id") Integer id, HttpSession session) {

		User user = userService.queryOneUser(id);

		session.setAttribute("u", user);

		return "redirect:/updateUser.jsp";

	}

	// @RequestMapping(value="/login",method=RequestMethod.POST)
	// public String login(User user){
	//
	// User user1=this.userService.login(user);
	// if(user1==null){
	//
	// return "redirect:/userlogin.jsp";
	// }
	//
	// if(!user1.getPassword().equals(user.getPassword())){
	//
	// return "redirect:/userlogin.jsp";
	// }
	//
	// return "redirect:/zhuce.jsp";
	//
	// }
	// 5.查看用户
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String list(Integer pageNow, HttpServletRequest request) {

		if (pageNow == null || pageNow < 1) {

			pageNow = 1;

		}
		PageBean<User> pb = userService.selectAllPage(pageNow);

	

		request.setAttribute("pb", pb);

		return "showUser";

	}
//修改头像
	@RequestMapping(value = "/user",method = RequestMethod.PUT)
	public String updateTouxiang(HttpServletRequest req, HttpServletResponse resp) {
		DiskFileItemFactory factory=new DiskFileItemFactory();
		
		ServletFileUpload upload=new ServletFileUpload(factory);
		
			try{
			List<FileItem> list=upload.parseRequest(req);
			
			FileItem fileItem=list.get(0);
			
			String idvalue=fileItem.getString("UTF-8");
			
			int id=Integer.parseInt(idvalue);
						
			FileItem fileItem1=list.get(1);
			
			String filename=fileItem1.getName();
			
			int index=filename.lastIndexOf("\\");
			
			if(index!=-1){
				
				filename=filename.substring(index+1);
			}
				
			String path=new File("D:\\JavaWeb\\touxiang").getAbsolutePath();
			
			int hashCode=filename.hashCode();
			
			String sl=Integer.toHexString(hashCode);
			
			char c1=sl.charAt(0);
			
			char c2=sl.charAt(1);
			
			path=path+"/"+c1+"/"+c2;
			
			File dir=new File(path);
			
			dir.mkdirs();
			
			String realName=UUID.randomUUID().toString()+" "+filename;
			
			String savepath="/"+c1+"/"+c2+"/"+realName;
			
			File file=new File(dir,realName);
			
			fileItem1.write(file);
			
			User user=new User();
			
			user.setId(id);
			
			user.setTouxiang(savepath);
			
			userService.updateTouxiang(user);

		
			}	catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();


		}
		
          	return "redirect:/users";
	
}
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public  String addTouxiang(HttpServletRequest req, HttpServletResponse resp){
		DiskFileItemFactory factory=new DiskFileItemFactory();
		
		ServletFileUpload upload=new ServletFileUpload(factory);
		
		try {
			
			List<FileItem> list=upload.parseRequest(req);
			
			FileItem fileItem=list.get(0);
			
			String namevalue=fileItem.getString("UTF-8");
			
			FileItem fileItem2=list.get(2);
			
			String accountvalue=fileItem2.getString("UTF-8");
			
			FileItem fileItem3=list.get(3);
			
			String passwordvalue=fileItem3.getString("UTF-8");
			
			FileItem fileItem4=list.get(4);
			
			String phonevalue=fileItem4.getString("UTF-8");
			
			FileItem fileItem5=list.get(5);
			
			
			String regdatevalue=fileItem5.getString("UTF-8");
			
			FileItem fileItem1=list.get(1);
			
			String filename=fileItem1.getName();
			
			int index=filename.lastIndexOf("\\");
			
			if(index!=-1){
				
				filename=filename.substring(index+1);
			}
			
			String path=new File("D:\\JavaWeb\\touxiang").getAbsolutePath();
			
			int hashCode=filename.hashCode();
			
			String sl=Integer.toHexString(hashCode);
			
			char c1=sl.charAt(0);
			
			char c2=sl.charAt(1);
			
			path=path+"/"+c1+"/"+c2;
			
			File dir=new File(path);
			
			dir.mkdirs();
			
			String realName=UUID.randomUUID().toString()+" "+filename;
			
			String savepath="/"+c1+"/"+c2+"/"+realName;
			
			File file=new File(dir,realName);
			
			fileItem1.write(file);
			
			User user=new User();
		
			user.setTouxiang(savepath);
			
			
			userService.saveTouxiang(user);

			
			
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/users";
	}
	@RequestMapping(value="/upload")
	public String upload(String userName,MultipartFile touxiang) throws IllegalStateException, IOException{
		System.out.println(userName);
		System.out.println(touxiang.getName());
		System.out.println(touxiang.getOriginalFilename());
		File file =new File("E:\\"+touxiang.getOriginalFilename());
		touxiang.transferTo(file);
		return "uploadOk";
		
	}
	@RequestMapping(value="/download")
	public ResponseEntity<byte[]> download(String filename,HttpServletRequest request) throws IOException{
		 InputStream  stream=request.getServletContext().getResourceAsStream("/images/"+filename);
		 byte[]body =new byte[stream.available()];
		 
		 stream.read(body);
		 HttpStatus statusCode = HttpStatus.OK;
		 HttpHeaders headers =new HttpHeaders();
		headers.add("Content-Disposition", "attachment;filename="+filename);
		ResponseEntity<byte[]> 	re =new ResponseEntity<byte[]> (body,headers,statusCode);
		
		return  re;
		
	}
	
	}
	
	
	
	
	
	
	
	
	



	

