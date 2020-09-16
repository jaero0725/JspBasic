<%@page import="kr.co.jsp.board.model.Board"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jsp.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	//BoardDAO 클래스의 selectAll()를 호출하여
    	//DB에 들어있는 모든 글들을 리스트로 반환받으셔야 합니다.
    	
    	List<Board> articles = BoardDAO.getInstance().selectAll();
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% if(articles.size() > 0) { %>

	<table border="1">
		<!-- 
			DB에서 얻어온 글이 하나도 없을 때는
			'게시물이 존재하지 않습니다.' 문장을 브라우저에 띄워주세요.
		 -->
	
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>비고</th>
		</tr>
		
		<!-- 
			selectAll() 결과값으로 리턴받은 리스트를
			반복문을 사용하여 하나씩 테이블에 출력해 주시면 되겠습니다.
		 -->
		 <% for(Board board : articles) { %>
			<tr>
				<td><%= board.getBoardId() %></td>
				<td><%= board.getWriter() %></td>
				<td>
					<a href="content.jsp?id=<%=board.getBoardId()%>"><%= board.getTitle() %></a>
				</td>
				<td><a href="delete.jsp?id=<%= board.getBoardId() %>">[삭제]</a></td>
			</tr>		 
		 <% } %>

	</table>
	
	<% } else { %>
		<p>게시물이 존재하지 않습니다.</p>
	<% } %>
	
	<br>
	
	<a href="write.jsp">게시글 작성하기</a>
	
</body>
</html>

















