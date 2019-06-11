//全局的方法

$.extend({

	print:function(a){
		
		document.write(a);
		
	},
	
	println:function(a){
		
		document.write(a+"<br>");
	}
});

//dom元素绑定的方法

$.fn.extend({
  
	out:function(a){
		
		alert(a);
	}
	
});