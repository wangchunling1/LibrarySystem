<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档-->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入jQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jQuery.js"></script>
<!-- 5.引入Bootstrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script>
<title>书目</title>
<script type="text/javascript">
	//增加成员函数 
	function addSort() {
		
		var name = document.getElementById("bkno").value;//获取ID属性值为name的元素 
		
		//创建元素tr，并设置ID属性为name。即表格中的行 
		var row = document.createElement("tr");
		
		row.setAttribute("id", document.getElementById("bkno").value);
		
		//创建元素td,并追加为元素tr的子元素 
		var cell = document.createElement("td");
		
		cell.appendChild(document.createTextNode(document.getElementById("bk no").value));
		
		row.appendChild(cell);
		
		//创建元素td,并追加为元素tr的子元素 
		var cell = document.createElement("td");
		
		cell.appendChild(document.createTextNode(document.getElementById("bk num").value));
		
		//创建元素td,并追加为元素tr的子元素
		var cell = document.createElement("td"); 
		
		cell.appendChild(document.createTextNode(document.getElementById("bk name").value)); 
		
		row.appendChild(cell); 
		
		//创建元素td,并追加为元素tr的子元素 
		var cell = document.createElement("td");
		
		cell.appendChild(document.createTextNode(document.getElementById("bk price").value));
		
		row.appendChild(cell);
		
		//创建元素td,并追加为元素tr的子元素
		var cell = document.createElement("td");
		
		cell.appendChild(document.createTextNode(document.getElementById("bk author").value));
		
		row.appendChild(cell);
		
		//创建元素td,并追加为元素tr的子元素 
		var cell = document.createElement("td");
		
		cell.appendChild(document.createTextNode(document.getElementById("bk year").value));
		
		row.appendChild(cell);
		
		//创建元素td,并追加为元素tr的子元素 
		var cell = document.createElement("td");
		
		cell.appendChild(document.createTextNode(document.getElementById("bk isbn").value));
		
		row.appendChild(cell);
		
		//创建元素删除按钮 
		var deleteButton = document.createElement("input");
		
		deleteButton.setAttribute("type", "button");
		
		deleteButton.setAttribute("value", "删除");
		
		deleteButton.onclick = function() {
			
			deleteSort(name);
		};
		
		cell = document.createElement("td");
		
		cell.appendChild(deleteButton);
		
		row.appendChild(cell);
		
		//添加deleteButton元素 
		document.getElementById("sortList").appendChild(row); 
		
		//清空输入框
		document.getElementById("name").value = "";
	}
	// 删除成员函数 
	function deleteSort(id) {
		
		if (id != null) {
			
			var delRow = document.getElementById(id);
			
			var sortList = document.getElementById("sortList");
			
			sortList.removeChild(delRow);
		}
	}
</script>
</head>
<body>
	<p align="center" class="Title ">图书管理平台</p>
	<table width="95%" align="center" cellpadding="5" cellspacing="0">
		<tr height="50px">
			<td><a name="000">图书入库</a></td>
		</tr>
		<tr height=50>
			<td><table width="100%" border="0">
					<tr>
						<th width="6%" height="26">序号：</th>
						<td colspan="3"><input name="bkno" type="text" id="bkno"
							size="30" /></td>
						<th width="9%">书代号：</th>
						<td colspan="2"><input name="bknum" type="text" id="bknum"
							size="30" /></td>
					</tr>
					<tr>
						<th height="26">书名：</th>
						<td height="26" colspan="3"><input name="bkname" type="text"
							id="bkname" size="30" /></td>
						<th height="26">作者：</th>
						<td height="26" colspan="2"><input name="bkauthor"
							type="text" id="bkauthor" size="30" /></td>
					</tr>
					<tr>
						<th height="26">定价：</th>
						<td width="27%" height="26"><input name="bkprice" type="text"
							id="bkprice" size="10" /></td>
						<th width="6%">年份：</th>
						<td width="19%"><input name="bkyear" type="text" id="bkyear"
							size="10" /></td>
						<th height="26" colspan="2">ISBN：</th>
						<td width="30%"><input name="bkisbn" type="text" id="bkisbn"
							size="30" /></td>
					</tr>
					<tr>
						<td height="26" colspan="7" align="center"><input
							type="submit" name="button" id="button" value="添加"
							onClick="addSort();"></td>
					</tr>
				</table></td>
		</tr>
	</table>
	<table width="95%" align="center" cellpadding="5" cellspacing="1">
		<tr valign="bottom">
			<td colspan="7"><a name="003">现存图书列表</a></td>
		</tr>
		<tr>
			<th width="43">序号</th>
			<th>书代号</th>
			<th width="399">书名</th>
			<th width="39">定价</th>
			<th width="65">作者</th>
			<th width="40">年份</th>
			<th>ISBN</th>
		</tr>
		<tbody id="sortList">
		</tbody>
	</table>
</body>
</html>
