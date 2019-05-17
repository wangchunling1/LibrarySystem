package com.oracle.web.controller;

@Controller
@Scope(value = "prototype")
public class FenleiHandler {
	
	@Autowired
	private FenleiService fenleiService;
	
	@RequestMapping(value = "/fenlei", method = RequestMethod.GET)
	
	public String Fenlei(HttpServletRequest request) {

		List<Fenlei> fList = fenleiService.list();

		request.setAttribute("fList", fList);

		return "showFenlei";
	}
	

}
