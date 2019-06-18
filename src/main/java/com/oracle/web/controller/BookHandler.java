package com.oracle.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean;
import com.oracle.web.service.BookService;
import com.oracle.web.service.FenleiService;
import com.oracle.web.test.DownUtils;

@Controller
@Scope(value = "prototype")
public class BookHandler {

	private static final String NONE = null;

	@Autowired
	private BookService bookService;

	@Autowired
	private FenleiService fenleiService;

//	@RequestMapping(value = "/books", method = RequestMethod.GET)
//	public String Books(HttpServletRequest request) {
//
//		List<Book> bList = bookService.list();
//
//		request.setAttribute("bList", bList);
//
//		return "showBook2";
//	}

	@RequestMapping(value = "validate1")
	@ResponseBody
	public String queryByName(String bname,HttpServletResponse response) throws IOException{

		//System.out.println(bname);

		Book b =bookService.queryOne(bname);

		response.setContentType("text/html;charset=utf-8");

        if(b!=null){
			
            response.getWriter().write("{\"valid\":\"false\"}");
		
			}else{
				
				response.getWriter().write("{\"valid\":\"true\"}");//不存在
			}
		
		return NONE;

	}
	@RequestMapping(value = "/addUI", method = RequestMethod.GET)
	public String addUI(HttpServletRequest request) {

		List<Fenlei> fList = fenleiService.list();
        //System.out.println(fList);
		//request.setAttribute("fList", fList);
        
        request.getSession().setAttribute("fList", fList);

		return "redirect:/addBook.jsp";
	}

	@RequestMapping(value = "/book", method = RequestMethod.POST)
	public String add(Book book) {

		bookService.save(book);

		return "redirect:/books";
	}

//	@RequestMapping(value = "/book/{id}", method = RequestMethod.DELETE)
//	public String delete(@PathVariable("id") Integer id) {
//
//		Book book = new Book();
//
//		book.setId(id);
//
//		bookService.delete(book);
//
//		return "redirect:/books";
//	}
	
	@RequestMapping(value = "/book/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") String ids) {

		String[] arr = ids.split(",");
		
		for(String str : arr){
			
			System.out.println(str);
		}
		bookService.delete1(arr);

		return "redirect:/books";
	}
	
	@RequestMapping(value = "/book/{id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("id") Integer id, HttpSession session) {
		
		Book book = bookService.queryOneBook(id);

		session.setAttribute("book", book);	
		
		List<Fenlei> flist = fenleiService.list();

		session.setAttribute("flist", flist);

		return "redirect:/updateBook.jsp";
	}

	@RequestMapping(value = "/book", method = RequestMethod.PUT)
	public String update(Book book) {

		bookService.update(book);
		
		return "redirect:/books";
	}
	
	@RequestMapping(value="/books",method=RequestMethod.GET)
	public String selectFY(Integer pageNow,HttpServletRequest req){
		
		if (pageNow == null || pageNow < 1) {

			pageNow = 1;

		}
		
		pageBean<SubBook> pb=bookService.showAllByPage(pageNow);
		
		req.setAttribute("pb", pb);

		return "showBook2";
		
	}
	
	@RequestMapping(value = "/outSelect/{ids}", method = RequestMethod.GET)
	public String outSelect(@PathVariable("ids") String ids, HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		String[] arr = ids.split(",");
		
		List<Book> list = bookService.queryBooks(arr);
		
		//System.out.println(list);

		String key = "选择";

		// 1.创建一个工作簿

		HSSFWorkbook workbook = new HSSFWorkbook();

		// 2.创建一个工作表

		HSSFSheet sheet = workbook.createSheet("图书信息表");

		// HSSFSheet sheet2 = workbook.createSheet();

		// 设置单元格的宽度,

		sheet.setColumnWidth(4, 15 * 256);

		// 3.创建行，并在行中写入数据（表头）

		// 创建一个样式对象

		HSSFCellStyle style = workbook.createCellStyle();

		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中

		HSSFFont font = workbook.createFont();// 设置字体样式的

		font.setBold(true);

		font.setColor(HSSFColor.BLUE.index);

		style.setFont(font);

		String[] title = { "图书编号", "图书名称", "图书价格", "出版社", "图书状态", "借书人", "分类编号" };

		HSSFRow row = sheet.createRow(0);// 从0开始,第一行

		for (int i = 0; i < title.length; i++) {

			HSSFCell cell = row.createCell(i);// 0 1 2 3 4

			cell.setCellStyle(style);

			cell.setCellValue(title[i]);

		}

		// 4.把list里面的数据放进去

		// List<Fenlei> list =
		// FenleiServiceFactory.getFenleiServiceImpl().showFenlei();

		// 在创建一个样式对象

		HSSFCellStyle style2 = workbook.createCellStyle();

		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		// 要几行？

		for (int i = 0; i < list.size(); i++) {// 循环几次创建几行

			HSSFRow row2 = sheet.createRow(i + 1);// 从第二行开始 1 2 3 4 5

			Book b = list.get(i);

			HSSFCell cell1 = row2.createCell(0);

			cell1.setCellStyle(style2);

			cell1.setCellValue(b.getId());

			HSSFCell cell2 = row2.createCell(1);

			cell2.setCellStyle(style2);

			cell2.setCellValue(b.getBname());

			HSSFCell cell3 = row2.createCell(2);

			cell3.setCellStyle(style2);

			cell3.setCellValue(b.getPrice());

			HSSFCell cell4 = row2.createCell(3);

			cell4.setCellStyle(style2);

			cell4.setCellValue(b.getChuban());
			
			HSSFCell cell5 = row2.createCell(4);
			
			cell5.setCellStyle(style2);

			cell5.setCellValue(b.getZhuangtai());

			HSSFCell cell6 = row2.createCell(5);

			cell6.setCellStyle(style2);

			cell6.setCellValue(b.getJieshuren());

			HSSFCell cell7 = row2.createCell(6);
			
			cell7.setCellStyle(style2);

			cell7.setCellValue(b.getfId());

		}

		// 内存，把数据输出到硬盘

		File f = new File("图书信息表.xls");

		OutputStream outputStream = new FileOutputStream(f);

		workbook.write(outputStream);// 把工作簿的内容输出到person.xls里面

		// 响应该浏览器

		String file = f.getName();// "person.xls"

		// System.out.println(file);

		String mime = req.getSession().getServletContext().getMimeType(file);

		String fileName = DownUtils.filenameEncoding(key + f.getName(), req);

		String disposition = "attachment;filename=" + fileName;

		// 设置两个响应头信息即可 (两个头)，告诉浏览器，我这个东西是下载的

		resp.setHeader("Content-Type", mime);

		resp.setHeader("Content-DisPosition", disposition);

		// 一个流 （两个流）

		// 把文件加载到内存

		InputStream inputStream = new FileInputStream(file);

		// 把流输出给浏览器

		ServletOutputStream out = resp.getOutputStream();

		// 复制

		IOUtils.copy(inputStream, out);

		return null;

	}

	//导出全部
	
	@RequestMapping(value = "/outAll", method = RequestMethod.GET)
	public String outAll(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		List<Book> list = bookService.list2();

		String key = "全部";

		// 1.创建一个工作簿

		HSSFWorkbook workbook = new HSSFWorkbook();

		// 2.创建一个工作表

		HSSFSheet sheet = workbook.createSheet("图书信息表");

		// HSSFSheet sheet2 = workbook.createSheet();

		// 设置单元格的宽度,

		sheet.setColumnWidth(4, 15 * 256);

		// 3.创建行，并在行中写入数据（表头）

		// 创建一个样式对象

		HSSFCellStyle style = workbook.createCellStyle();

		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中

		HSSFFont font = workbook.createFont();// 设置字体样式的

		font.setBold(true);

		font.setColor(HSSFColor.BLUE.index);

		style.setFont(font);

		String[] title = { "图书编号", "图书名称", "图书价格", "出版社", "图书状态", "借书人", "分类编号" };

		HSSFRow row = sheet.createRow(0);// 从0开始,第一行

		for (int i = 0; i < title.length; i++) {

			HSSFCell cell = row.createCell(i);// 0 1 2 3 4

			cell.setCellStyle(style);

			cell.setCellValue(title[i]);

		}

		// 4.把list里面的数据放进去

		// List<Fenlei> list =
		// FenleiServiceFactory.getFenleiServiceImpl().showFenlei();

		// 在创建一个样式对象

		HSSFCellStyle style2 = workbook.createCellStyle();

		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		// 要几行？

		for (int i = 0; i < list.size(); i++) {// 循环几次创建几行

			HSSFRow row2 = sheet.createRow(i + 1);// 从第二行开始 1 2 3 4 5

			Book b = list.get(i);

			HSSFCell cell1 = row2.createCell(0);

			cell1.setCellStyle(style2);

			cell1.setCellValue(b.getId());

			HSSFCell cell2 = row2.createCell(1);

			cell2.setCellStyle(style2);

			cell2.setCellValue(b.getBname());

			HSSFCell cell3 = row2.createCell(2);

			cell3.setCellStyle(style2);

			cell3.setCellValue(b.getPrice());

			HSSFCell cell4 = row2.createCell(3);

			cell4.setCellStyle(style2);

			cell4.setCellValue(b.getChuban());

            HSSFCell cell5 = row2.createCell(4);
			
			cell5.setCellStyle(style2);

			cell5.setCellValue(b.getZhuangtai());

			HSSFCell cell6 = row2.createCell(5);

			cell6.setCellStyle(style2);

			cell6.setCellValue(b.getJieshuren());

			HSSFCell cell7 = row2.createCell(6);

			cell7.setCellStyle(style2);

			cell7.setCellValue(b.getfId());

		}

		// 内存，把数据输出到硬盘

		File f = new File("图书信息表.xls");

		OutputStream outputStream = new FileOutputStream(f);

		workbook.write(outputStream);// 把工作簿的内容输出到person.xls里面

		// 响应该浏览器

		String file = f.getName();// "person.xls"

		// System.out.println(file);

		String mime = req.getSession().getServletContext().getMimeType(file);

		String fileName = DownUtils.filenameEncoding(key + f.getName(), req);

		String disposition = "attachment;filename=" + fileName;

		// 设置两个响应头信息即可 (两个头)，告诉浏览器，我这个东西是下载的

		resp.setHeader("Content-Type", mime);

		resp.setHeader("Content-DisPosition", disposition);

		// 一个流 （两个流）

		// 把文件加载到内存

		InputStream inputStream = new FileInputStream(file);

		// 把流输出给浏览器

		ServletOutputStream out = resp.getOutputStream();

		// 复制

		IOUtils.copy(inputStream, out);

		return null;

	}
	
	@RequestMapping(value="/bookByWhere",method=RequestMethod.GET)
	public String ByWhere(Book where,String url,int pageNow,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException{
		
		url = this.getURL2(request);
		
		//System.out.println("==="+url);
		
        String bname=where.getBname();
		
	    where.setBname(new String(bname.getBytes("ISO-8859-1"),"UTF-8"));
	    
        String chuban=where.getChuban();
	    
	    where.setChuban(new String(chuban.getBytes("ISO-8859-1"),"UTF-8"));
	    
        String zhuangtai=where.getZhuangtai();
	    
	    where.setZhuangtai(new String(zhuangtai.getBytes("ISO-8859-1"),"UTF-8"));
	    
        String jieshuren=where.getJieshuren();
	    
	    where.setJieshuren(new String(jieshuren.getBytes("ISO-8859-1"),"UTF-8"));
	    
		pageBean<SubBook> pb = bookService.selectAllByPageAndWhere(where,pageNow);
		
		pb.setUrl(url);
		
		//System.out.println(pb);
			
		session.setAttribute("pb", pb);
		
		List<Fenlei> flist =fenleiService.list();
		
		session.setAttribute("flist", flist);
		
		return "redirect:/showBook.jsp";
	}
	
    private String getURL2(HttpServletRequest req) {
		
        String url=this.getURL(req);
		
        //System.out.println("---"+url);
        
        int index=url.lastIndexOf("&pageNow=");
        
        //System.out.println("index=="+index);
	    
	    if(index == -1){
	    	
	    	return url;
	    	
	    	
	    }else{
	    
		return url.substring(0,index);
	    }
	}

	private String getURL(HttpServletRequest req) {
		
        String path=req.getContextPath();///LibrarySystem
		
		String servlet=req.getServletPath();// bookByWhere 
		
		String param=req.getQueryString();		
		
		return path+servlet+"?"+param;
		
	}
	
}
