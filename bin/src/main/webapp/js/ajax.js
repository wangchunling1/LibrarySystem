 // 1.得到XMLHttpRequest对象

       function getXMLHttpRequest(){
       	
       	
       	   try{// 非IE浏览器
       	   	
       	   	return  new XMLHttpRequest();
       	   	
       	   }catch(e){
       	   	
       	   
       	   	   try{// ie低版本
       	   	   	
       	   	   	   return new AcitveXObject("Microsoft.XMLHTTP");
       	   	   	
       	   	   }catch(e){
       	   	   	
       	   	   	
       	   	   	    try{// ie高版本的
       	   	   	    	
       	   	   	    	return new ActiveXObject("Msxml2.XMLHTTP");
       	   	   	    	
       	   	   	    }catch(e){
       	   	   	    	// 这个情况一般不会发生
       	   	   	    	
       	   	   	    	alert("哥们，你用的浏览器是什么鬼？请换一个吧");
       	   	   	    	
       	   	   	    	throw e;
       	   	   	    	
       	   	   	    }
       	   	   	
       	   	   	
       	   	   }
       	   	
       	   }
       	
       	
       }
       
   
       function ajax(opt){
       	
       	 // 1.得到对象
		 var http=getXMLHttpRequest();
		   
		 // 2.打开链接	 
		 if(!opt.method){
		 			
			opt.method="GET";
			
     	}
     	
     	if(opt.ansy==undefined){
     		
     		opt.ansy=true;
     	}
     	
     	http.open(opt.method,opt.url,opt.ansy);
		 
		 // 3.发送请求
     	if(opt.method=="POST"){
     		
     		http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
     	}
		 http.send(opt.params);
		 
		 // 4.监听请求响应的变化
		 http.onreadystatechange=function(){
		 	
		 	if(http.readyState==4 && http.status==200){
		 		
		 		var data;
		 		
		 		if(!opt.type){
		 			
		 			data=http.responseText;
		 			
		 		}else if(opt.type=="text"){
		 			
		 			data=http.responseText;
		 			
		 		}else if(opt.type=="xml"){
		 			
		 			data=http.responseXML;
		 			
		 		}else if(opt.type=="json"){
		 			
		 			var content=http.responseText;
		 			
		 			data=eval("("+content+")");
		 		}
		 		
		 		//5.交给success方法来处理
		 		opt.success(data);	 
		 	}
		 	
		 }
       }