<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
	<h1>uploadFile.jsp</h1>
	${fileName}
	
	<!-- 파일 다운로드 기능 -->
	<%
/* 	String filename="", imgurl="", wno="", cnt="";
	
    // 쿠키값 가져오기
    Cookie[] cookies = request.getCookies() ;	     
    if(cookies != null){	         
        for(int i=0; i < cookies.length; i++){
            Cookie c = cookies[i] ;
            // 저장된 쿠키 이름을 가져온다
            String cName = c.getName();	             
            // 쿠키값을 가져온다
            String cValue = c.getValue();	   
            
            if(cName.equals("filename"))
            	filename = cValue;
            else if(cName.equals("imgurl"))
            	imgurl = cValue;
            else if(cName.equals("wno"))
            	wno = cValue;
            else if(cName.equals("cnt"))
            	cnt = cValue;
        }
    }
	imgurl = imgurl.replace("%3A",":");
    
	System.out.println("filename : "+filename);
	System.out.println("imgurl : "+imgurl);
	System.out.println("wno : "+wno);
	System.out.println("cnt : "+cnt); */
	
	response.sendRedirect("insertOk.do");
	%>
	
	
	
	
	<form action="download.do" method="post">
		<input type="hidden" name="filename" value="${fileName}"/>
		<input type="submit" value="다운로드">
	</form>
</body>
</html>