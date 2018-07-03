<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../header.jsp" %>
<%@include file="../footer.jsp" %>

<p><a href="bbsList.jsp">[글목록]</a></p>

<form name="bbsfrm" method="post" action="bbsIns.jsp" onsubmit="return bbsCheck(this)" >
<table style="margin: auto">
<tr>
    <th>작성자</th>
    <td>
    <input type="text" name="wname" size="10">
    </td>
</tr> 
<tr>
    <th>제목</th>
    <td><input type="text" name="subject" size="20"></td>
</tr> 
<tr>
    <th>내용</th>
    <td>
      <textarea rows="5" cols="30" name="content"></textarea>
    </td>
</tr> 
<tr>
    <th>비밀번호</th>
    <td><input type="password" name="passwd" size="10"></td>
</tr> 
<tr>
    <td colspan="2" align="center">
      <input type="submit" value="쓰기">
      <input type="reset"  value="취소">
    </td>
</tr> 
</table>
</form>