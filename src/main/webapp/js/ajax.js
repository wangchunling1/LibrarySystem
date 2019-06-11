 //1.�õ�XMLHttpRequest����

       function getXMLHttpRequest(){
       	
       	
       	   try{//��IE�����
       	   	
       	   	return  new XMLHttpRequest();
       	   	
       	   }catch(e){
       	   	
       	   	
       	   	   try{//
       	   	   	
       	   	   	   return new AcitveXObject("Microsoft.XMLHTTP");
       	   	   	
       	   	   }catch(e){
       	   	   	
       	   	   	
       	   	   	    try{//ie�߰汾��
       	   	   	    	
       	   	   	    	return new ActiveXObject("Msxml2.XMLHTTP");
       	   	   	    	
       	   	   	    }catch(e){
       	   	   	    	//������һ�㲻�ᷢ��
       	   	   	    	
       	   	   	    	alert("���ǣ����õ��������ʲô���뻻һ����");
       	   	   	    	
       	   	   	    	throw e;
       	   	   	    	
       	   	   	    }
       	   	   	
       	   	   	
       	   	   }
       	   	
       	   }
       	
       	
       }
               function ajax(opt){
               	var http=getXMLHttpRequest();
               	//打开连接默认get
               	if(!opt.method){
               	 	opt.method="GET";
               	 }
               	 if(opt.ansy==undefined){
               	 	opt.ansy=true;
               	 }
               	 http.open(opt.method,opt.url,opt.ansy);
               	   if(opt.method=="POST"){
               	   	http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
               	   }
               	 http.send(opt.params);
               	 http.onreadystatechange=function(){
               	 		if(http.readyState==4 && http.status==200){
               	 			 var date;
               	 			 if(!opt.type){
               	 			 	date=http.responseText;
               	 			 }
               	 			 else if(opt.type=="text"){
               	 			 	date=http.responseText;
               	 			 	
               	 			 }else if(opt.type=="xml"){
               	 			 	date=http.responseXML;
               	 			 }else if(opt.type=="json"){
               	 		       var content=http.responseText;
               	 		           date=eval("("+content+")");
               	 			  }
               	 			 opt.success(date);
               	 		}
               	 }
               }
       