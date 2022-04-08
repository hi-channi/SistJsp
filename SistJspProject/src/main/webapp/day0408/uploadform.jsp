<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<form action="uploadproc.jsp" method="post" enctype="multipart/form-data">
   <table class="table table-hover" style="width: 500px;">
      <tr>
         <th width="100">이름</th>
            <td>
            <input type="text" name="name">
            </td>
      </tr>
      <tr>
         <th width="100">제목</th>
            <td>
            <input type="text" name="title">
            </td>
      </tr>
      <tr>
         <th width="100">파일</th>
            <td>
            <input type="file" name="uploadfile">
            </td>
      </tr>
      <tr>
         <td colspan="2" align="center">
            <input type="submit" value="업로드">
         </td>
      </tr>
   </table>
</form>

</body>
</html>