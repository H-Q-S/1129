<%--
  Created by IntelliJ IDEA.
  User: 刘子欣
  Date: 2023/11/9
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<h3>图书信息</h3>
<table width="90%" align="center" border="1px" cellspacing="0" >
    <tr align="center">
        <th>编号</th>
        <th>封面</th>
        <th>名称</th>
        <th>作者</th>
        <th>价格</th>
        <th>库存</th>
        <th>类型</th>
        <th>描述</th>
        <th>操作</th>
    </tr>
<c:forEach items="${bookPageHelper.list}" var="book">
    <tr align="center">
        <td>${book.bookId}</td>
        <td><img src="${book.bookImgPath}" height="42px"></td>
        <td>${book.bookName}</td>
        <td>${book.bookAuthor}</td>
        <td><fmt:formatNumber value="${book.bookPrice}" type="currency"/> </td>
        <td>${book.bookStock}</td>
        <td>
            <c:if test="${book.bookType==1}">原创</c:if>
            <c:if test="${book.bookType==2}">翻译</c:if>
        </td>
        <td>${book.bookDesc}</td>
        <td>
            <a href="BookQueryServlet?bookId=${book.bookId}">修改</a>
            <a href="BookDeleteServlet?bookId=${book.bookId}" onclick="javascript:return confirm('你确定要删除吗?')">删除</a>
        </td>
    </tr>
</c:forEach>
    <%--显示分页效果--%>
    <tr height="50px">
        <td colspan="9" align="center">从
            <!-- 显示首页，如果当前页是首页，则不显示超链接-->
            <c:if test="${bookPageHelper.pageNum==1}">
                <label style="color: gray">首页</label>
                <label style="color: gray">上一页</label>
            </c:if>
            <c:if test="${bookPageHelper.pageNum>1}">
                <a href="BookListServlet?pageNum=1">首页 </a>
                <a href="BookListServlet?pageNum=${bookPageHelper.pageNum-1}">上一页 </a>
            </c:if>
            当前第${bookPageHelper.pageNum}页/共${bookPageHelper.pageCount}页
            <c:if test="${bookPageHelper.pageNum<bookPageHelper.pageCount}">
                <a href="BookListServlet?pageNum=${bookPageHelper.pageNum+1}">下一页 </a>
                <a href="BookListServlet?pageNum=${bookPageHelper.pageCount}">尾页 </a>
            </c:if>
            <c:if test="${bookPageHelper.pageNum==bookPageHelper.pageCount}">
                <label style="color: gray">下一页</label>
                <label style="color: gray">尾页</label>
            </c:if>
        </td>
    </tr>

</table>

</body>
</html>