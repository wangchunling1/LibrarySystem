 // 1.�õ�XMLHttpRequest����

       function getXMLHttpRequest(){
       	
       	
       	   try{// ��IE�����
       	   	
       	   	return  new XMLHttpRequest();
       	   	
       	   }catch(e){
       	   	
       	   
       	   	   try{// ie�Ͱ汾
       	   	   	
       	   	   	   return new AcitveXObject("Microsoft.XMLHTTP");
       	   	   	
       	   	   }catch(e){
       	   	   	
       	   	   	
       	   	   	    try{// ie�߰汾��
       	   	   	    	
       	   	   	    	return new ActiveXObject("Msxml2.XMLHTTP");
       	   	   	    	
       	   	   	    }catch(e){
       	   	   	    	// ������һ�㲻�ᷢ��
       	   	   	    	
       	   	   	    	alert("���ǣ����õ��������ʲô���뻻һ����");
       	   	   	    	
       	   	   	    	throw e;
       	   	   	    	
       	   	   	    }
       	   	   	
       	   	   	
       	   	   }
       	   	
       	   }
       	
       	
       }
       
   
       function ajax(opt){
       	
       	 // 1.�õ�����
		 var http=getXMLHttpRequest();
		   
		 // 2.������	 
		 if(!opt.method){
		 			
			opt.method="GET";
			
     	}
     	
     	if(opt.ansy==undefined){
     		
     		opt.ansy=true;
     	}
     	
     	http.open(opt.method,opt.url,opt.ansy);
		 
		 // 3.��������
     	if(opt.method=="POST"){
     		
     		http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
     	}
		 http.send(opt.params);
		 
		 // 4.����������Ӧ�ı仯
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
		 		
		 		//5.����success����������
		 		opt.success(data);	 
		 	}
		 	
		 }
       }