package com.oracle.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
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
import org.apache.poi.util.IOUtils;
import org.junit.runners.Parameterized.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.User;
import com.oracle.web.service.UserService;
import com.oracle.web.test.DownUtils;
import com.oracle.web.bean.pageBean;

@Controller
@Scope(value = "prototype")
public class UserHandler {

	@Autowired
	private UserService userService;

	// 添加用户
	@RequestMapping(value = "/add", method = RequestMethod.POST)

	public String add(MultipartFile touxiang, String name, String userName, String password, String phone, String time,
			HttpSession session) throws IllegalStateException, IOException {
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

		//System.out.println(realsavepath);

		User user = new User(null, realsavepath, name, userName, password, phone, time);

		int i = this.userService.addUser(user);

		session.setAttribute("url", realsavepath);

		if (i > 0) {

			//System.out.println("添加成功");

			return "redirect:/showUserByPage";

		} else {

			//System.out.println("添加失败");

			return "addUser";
		}

	}

	// 验证用户名是否存在
	@RequestMapping(value = "/validateUser", method = RequestMethod.GET)
	public String validateUser(String userName, HttpServletResponse response) throws IOException {

		//System.out.println(userName);

		User i = this.userService.validateUser(userName);

		if (i != null) {

			response.getWriter().write("{\"valid\":\"false\"}");// 存在

		} else {

			response.getWriter().write("{\"valid\":\"true\"}");// 不存在
		}

		return null;
	}

	// 单查
	@RequestMapping(value = "/updateUser/{id}", method = RequestMethod.GET)
	public String updateUser(@PathVariable(value = "id") Integer id, Integer pageNow, HttpSession session) {

		User user = userService.selectOne(id);

		session.setAttribute("user", user);

		return "redirect:/updateUser.jsp";

	}

	// 修改用户
	@RequestMapping(value = "/updateUser", method = RequestMethod.PUT)
	public String update(User user) {
    //System.out.println(user.toString());
		userService.updateUser(user);

		return "redirect:/showUserByPage";

	}
	//// 删除用户
	// @RequestMapping(value = "/user/{ids}", method = RequestMethod.DELETE)
	// public String delete(@PathVariable("ids") String ids) {
	//
	// this.userService.delete(ids);
	//
	// return "redirect:/showUserByPage";
	// }

	@RequestMapping(value = "/user/{ids}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("ids") String ids) {

		String[] arr = ids.split(",");

		this.userService.delete1(arr);

		return "redirect:/showUserByPage";
	}

	// 查看用户
	@RequestMapping(value = "/showUserByPage", method = RequestMethod.GET)
	public String showByPage(Integer pageNow, HttpServletRequest request) {

		if (pageNow == null || pageNow < 0) {

			pageNow = 1;

		}
		pageBean<User> pb = userService.showByPage(pageNow);

		request.setAttribute("pb", pb);

		return "showUser";

	}

	// 修改头像
	@RequestMapping(value = "/updateTouxiang", method = RequestMethod.POST)
	public String updateTouxiang(@RequestParam(value="id")Integer id,@RequestParam(value="touxiang") MultipartFile touxiang, HttpSession session) throws Exception {

		//System.out.println("修改头像");

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

		User user = new User();

		String realsavepath = "upload" + savepath;

		user.setId(id);

		user.setTouxiang(realsavepath);

		this.userService.updateTouxiang(user);

		return "redirect:/updateUser/" + id;

	}

	// 导出
	@RequestMapping(value = "/outPutUser/{ids0}", method = RequestMethod.GET)
	public String outPutUser(@PathVariable(value = "ids0") String ids, HttpServletRequest req,
			HttpServletResponse response) throws IOException {

		String[] arr = ids.split(",");

		List<User> list = userService.queryUsers(arr);

		String key = "选择";
		// 创件一个工作蒲
		HSSFWorkbook workbook = new HSSFWorkbook();

		// 创建一个工作表
		HSSFSheet sheet = workbook.createSheet(key + "用户信息表");

		sheet.setColumnWidth(7, 15 * 256); // 设定列宽度
		// 设置样式
		HSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		HSSFFont font = workbook.createFont();
		font.setBold(true);
		font.setColor(HSSFColor.DARK_RED.index);
		style.setFont(font);
		String[] title = { "编号", "头像", "姓名", "用户名", "密码", "手机", "注册时间" };
		HSSFRow row = sheet.createRow(0);// 从0开始
		for (int i = 0; i < title.length; i++) {
			HSSFCell cell = row.createCell(i);
			cell.setCellStyle(style);
			cell.setCellValue(title[i]);
		}
		HSSFCellStyle style1 = workbook.createCellStyle();
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中
		// 设置字体样式
		for (int i = 0; i < list.size(); i++) {

			HSSFRow row1 = sheet.createRow(i + 1);
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
		File f = new File("用户信息表.xls");

		OutputStream outputStream = new FileOutputStream(f);

		workbook.write(outputStream);// 把工作簿的内容输出到person.xls里面

		// 响应该浏览器

		String file = f.getName();// "person.xls"

		// System.out.println(file);

		String mime = req.getSession().getServletContext().getMimeType(file);

		String fileName = DownUtils.filenameEncoding(key + f.getName(), req);

		String disposition = "attachment;filename=" + fileName;

		// 设置两个响应头信息即可 (两个头)，告诉浏览器，我这个东西是下载的

		response.setHeader("Content-Type", mime);

		response.setHeader("Content-DisPosition", disposition);

		// 一个流 （两个流）

		// 把文件加载到内存

		InputStream inputStream = new FileInputStream(file);

		// 把流输出给浏览器

		ServletOutputStream out = response.getOutputStream();

		// 复制

		IOUtils.copy(inputStream, out);

		return null;
	}
	
	// 导出
		@RequestMapping(value = "/all", method = RequestMethod.GET)
		public String outPutAll(HttpServletRequest req,HttpServletResponse response) throws IOException {

			List<User> list = userService.list2();

			String key = "全部";
			// 创件一个工作蒲
			HSSFWorkbook workbook = new HSSFWorkbook();

			// 创建一个工作表
			HSSFSheet sheet = workbook.createSheet(key + "用户信息表");

			sheet.setColumnWidth(7, 15 * 256); // 设定列宽度
			// 设置样式
			HSSFCellStyle style = workbook.createCellStyle();
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			HSSFFont font = workbook.createFont();
			font.setBold(true);
			font.setColor(HSSFColor.DARK_RED.index);
			style.setFont(font);
			String[] title = { "编号", "头像", "姓名", "用户名", "密码", "手机", "注册时间" };
			HSSFRow row = sheet.createRow(0);// 从0开始
			for (int i = 0; i < title.length; i++) {
				HSSFCell cell = row.createCell(i);
				cell.setCellStyle(style);
				cell.setCellValue(title[i]);
			}
			HSSFCellStyle style1 = workbook.createCellStyle();
			style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中
			// 设置字体样式
			for (int i = 0; i < list.size(); i++) {

				HSSFRow row1 = sheet.createRow(i + 1);
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
			File f = new File("用户信息表.xls");

			OutputStream outputStream = new FileOutputStream(f);

			workbook.write(outputStream);// 把工作簿的内容输出到person.xls里面

			// 响应该浏览器

			String file = f.getName();// "person.xls"

			// System.out.println(file);

			String mime = req.getSession().getServletContext().getMimeType(file);

			String fileName = DownUtils.filenameEncoding(key + f.getName(), req);

			String disposition = "attachment;filename=" + fileName;

			// 设置两个响应头信息即可 (两个头)，告诉浏览器，我这个东西是下载的

			response.setHeader("Content-Type", mime);

			response.setHeader("Content-DisPosition", disposition);

			// 一个流 （两个流）

			// 把文件加载到内存

			InputStream inputStream = new FileInputStream(file);

			// 把流输出给浏览器

			ServletOutputStream out = response.getOutputStream();

			// 复制

			IOUtils.copy(inputStream, out);

			return null;
		}
}
