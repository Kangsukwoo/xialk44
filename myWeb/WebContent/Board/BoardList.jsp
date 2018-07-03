<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../header.jsp" %>
<%@include file="../footer.jsp" %>
<%@page import="board.BoardDTO" %>
<%@page import="board.BoardDAO" %>
<%@page import="utility.*" %>
 
<% request.setCharacterEncoding("utf-8");%>


<% 
/* 검색 */
String col = request.getParameter("col");
String word = request.getParameter("word");
col = Utility.checkNull(col);
word = Utility.checkNull(word);

int nowPage=1;
if(request.getParameter("nowPage")!=null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}
%>
<%
BoardDAO dao = new BoardDAO();

int totalRecord = dao.count(col, word);	//글갯수출력

int recordPerPage = 10;	// 한페이지당 글갯수

BoardDTO dto = new BoardDTO();

ArrayList<BoardDTO>list = dao.list(col, word, nowPage, recordPerPage);

if(list==null){
    out.println("<tr>");
    out.println("  <td colspan='5'><strong>관련자료 없음!!</strong></td>");
    out.println("</tr>");
  }else{
	
	String today = Utility.getDate();	//현재날짜	
    
%>

<div align="center">	
	글갯수 : <strong><%=totalRecord %></strong>건
		<table border="1">
			<tr>
				<th>번호</th>
				<th>글제목</th>
				<th>아이디</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
<% 		
	for(int idx=0; idx<list.size(); idx++) {
	    	dto = list.get(idx);
%>	   	
			<tr>
				<td><%=dto.getSeq() %></td>						
				<td><a href='BoardRead.jsp?seq=<%=dto.getSeq()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'><%=dto.getTitle() %></a></td>					
				<td><%=dto.getId() %></td>						
				<td><%=dto.getLogtime() %></td>			
				<td><%=dto.getHit() %></td>		
			</tr>
			
<%
    }//for end
%>			
		
<%
  }//if end
%>		
			<tr>
			<td colspan="5">
			<!-- 페이지리스트 -->
<% 
			String paging = new Paging().paging1(totalRecord, nowPage, recordPerPage, col, word, "BoardList.jsp");
			out.print(paging);
%>					
			</td>
			</tr>
			

			<tr>	
				<td colspan="6" align="right">		
				<input type="button" value="글쓰기" onclick="javascript:location.href='BoardWrite.jsp'">
				<input type="button" value="home" onclick="javascript:location.href='../index.jsp'">
				</td>
			</tr>			
		</table>		
			<!--검색시작-->
	
				<form method="post" action="BoardList.jsp" onsubmit="return search(this)">
					<select name="col">						
						<option value="id">아이디
						<option value="title" selected>제목
						<option value="content"> 내용
						<option value="title_content">제목+내용
					</select>
						<input type="text" name="word">
						<input type="submit"  value="검색">						
				</form>
			
		
		<!--검색끝-->
	</div>